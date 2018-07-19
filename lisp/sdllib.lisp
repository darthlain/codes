;説明
;sdl-with-initでウインドウ表示

;この順番じゃないと駄目
;(defparameter *変数* 'key)
;(defkeystateload keystate *変数* *hensu*)
;(defparameter *keystate* (make-instance 'keystate))

;(add-keynumで*keynum*の対応するハッシュに1たされる 離すとnilに戻る
;1しか足されないので 複数たせるようにしたり
;上限なく足されていくので上限を設けたり改造しよう！

;lispbuilder-sdl standalone

(defparameter *keystate* nil)

(defmacro sdl-with-init (&key title window-x window-y frame
                         font-name font-size init main)
  `(sdl:with-init ()
     (if ,font-name
       (sdl:initialise-default-font
         (make-instance 'sdl:ttf-font-definition :size ,font-size
                        :filename ,font-name))
       (sdl:initialise-default-font sdl:*font-10x20*))
     (sdl:window ,window-x ,window-y :title-caption ,title)
     (setf (sdl:frame-rate) ,frame)
     ,init
     (sdl:update-display)
     (sdl:with-events ()
       (:quit-event () t)
       (:key-down-event (:key key)
        (if (sdl:key=  key :sdl-key-escape)
          (sdl:push-quit-event)
          (update-key-state key t *keystate*)))
       (:key-up-event  (:key key)
          (update-key-state key nil *keystate*))
       (:idle ()
        ,main
        (sdl:update-display)))))

(defun load-png-image (source-file)
  (sdl:convert-to-display-format :surface (sdl:load-image source-file)
                                 :enable-alpha t
                                 :pixel-alpha t))

(defmacro drawbox (&rest args)
  `(sdl:draw-box-* ,@args))

(defun drawstring (string x y &key (font sdl:*default-font*)
                          (color sdl:*default-color*))
  ;(if (equal "" string) (setf string " "))
  (sdl:draw-string-solid-* string x y :font font :color color))

(defun drawcircle (x0 y0 r &key (surface sdl:*default-surface*)
                      (color sdl:*default-color*) (stroke-color nil)
                      (alpha nil) (gfx-loaded-p sdl:*gfx-loaded-p*))
  (sdl:draw-filled-circle-* x0 y0 r :surface surface :color color
                            :stroke-color stroke-color :alpha alpha
                            :gfx-loaded-p gfx-loaded-p))

(defun drawimage (image x y)
  (sdl:draw-surface-at-* image x y))

(defun cleardisplay ()
  (sdl:clear-display sdl:*black*))

(defun cleardisplayw ()
  (sdl:clear-display sdl:*white*))

(defun cleardisplayc (color)
  (sdl:clear-display color))

(defun cleardisplayg ()
  (cleardisplayc sdl:*green*))

(defmacro drawstringb (&rest args)
  `(drawstring ,@args :color sdl:*black*))

(defp *keynum* (make-hash-table))

(defgeneric update-key-state (key key-press key-state))

(defmacro defkeystate (name &rest key-maps)
  `(progn
     ;(defparameter *key-maps* (mapcar #'cadr ',key-maps))
     (defclass ,name ()
       ,(loop for k in key-maps collect `(,(car k) :initform nil)))
     ,(let ((key (gensym)) (key-press (gensym)) (key-state (gensym)))
        `(defmethod update-key-state (,key ,key-press (,key-state ,name))
           (with-slots ,(mapcar #'car key-maps) ,key-state
             (cond ,@(loop for k in key-maps
                           collect `((sdl:key= ,key ,(cadr k))
                                     (setf ,(car k) ,key-press)))))))
     ,(let ((l (gensym)) (a (gensym)))
        `(let1 (,l ',(mapcar #'car key-maps))
           (dotimes (,a (length ,l))
             (setf (gethash (nth ,a ,l) *keynum*) 0))
           (defun add-keynum ()
             (with-slots ,(mapcar #'car key-maps) *keystate*
               ,@(loop for k in key-maps
                       collect
                       `(if ,(car k)
                          (if (gethash ',(car k) *keynum*)
                            (incf (gethash ',(car k) *keynum*))
                            (setf (gethash ',(car k) *keynum*) 0))
                          (setf (gethash ',(car k) *keynum*) nil)))))))))

;変数を取って (変数の中身 :sdl-key-変数の中身)の様に呼び出す
(defmacro defkeystateload (name &rest keyvars)
  `(defkeystate
     ,name
     ,@(loop for i in keyvars
             collect
             `(,(symbol-value i)
                ,(read-from-string
                   (concatenate 'string ":sdl-key-"
                                (string (symbol-value i))))))))

;設定例
;(defkeystate keystate
;             (up    :sdl-key-up)
;             (down  :sdl-key-down))
;
;(defp *keystate* (make-instance 'keystate))

(let* ((down nil)
       (cl (lambda () (if (sdl:mouse-left-p)
                        (if down nil (progn (setf down t) 'down))
                        (if down (progn (setf down nil) 'up) nil)))))
  (defun mouse-left-updown ()
    (funcall cl)))

(defun getkey (key)
  (gethash key *keynum*))

(defun eqkeynum (num key)
  (eq num (gethash key *keynum*)))

;numでタイミング指定
(defmacro keypush (num key &body body)
  `(when (eq ,num (getkey ,key))
     ,@body)) 

(defmacro keypushing (key &body body)
  `(when (getkey ,key)
     ,@body))

(defmacro statecase (&rest c)
  `(case-equal *state*
               ,@(loop for i in c
                       collect `(,i (,i)))))

;ステートの定義 slimvは長すぎるとカッコがうまくいかない
(defmacro statedef (&rest fncs)
  `(progn (defun state ()
            (statecase ,@(mapcar #'cadr fncs)))
          ,@fncs))

;ゲームループのためのstateを更新する
(defun state! (state)
  (setf *state* state)) 
