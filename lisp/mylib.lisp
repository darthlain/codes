;(ql:quickload :split-sequence)
;(unlock-package :sb-alien)
;(proclaim
;  '(inline last1 singlep append1 nconc1 mklist xyconvert relist remmul
;           split double))

(defvar *alphabets* '(a b c d e f g h i
                      j k l m n o p q r
                      s t u v w x y z))

(defvar *hiraganas* '(あ い う え お
                      か き く け こ
                      さ し す せ そ
                      た ち つ て と
                      な に ぬ ね の
                      は ひ ふ へ ほ
                      ま み む め も
                      や    ゆ    よ
                      ら り る れ ろ
                      わ    を    ん
                      が ぎ ぐ げ ご
                      ざ じ ず ぜ ぞ
                      だ ぢ づ で ど
                      ば び ぶ べ ぼ
                      ぱ ぴ ぷ ぺ ぽ
                      ぁ ぃ ぅ ぇ ぉ
                      ゃ ゅ ょ っ))

(defmacro lazy (&body body)
  (let ((forced (gensym))
        (value (gensym)))
    `(let ((,forced nil)
           (,value nil))
       (lambda ()
         (unless ,forced
           (setf ,value (progn ,@body))
           (setf ,forced t))
         ,value))))

(defun force (lazy-value)
  (funcall lazy-value))

(defun pick (lst)
  (nth (random (length lst)) lst))

(defun make-name (x symbol-list)
  (apply #'concatenate 'string
         (loop for i in (make-list x)
               collect (symbol-name (pick symbol-list)))))

(defun random-list (lst)
  (dotimes (x (length lst) lst)
    (rotatef (nth x lst) (nth (random (length lst)) lst))))

(defun numtolist (x)
  (labels ((f (x acc) (if (zerop x) acc
                          (multiple-value-bind (a b) (truncate x 10)
                            (f a (cons b acc))))))
    (f x nil)))

(defun group (source n)
  (if (zerop n) (error "zero length"))
  (labels ((rec (source acc)
             (let ((rest (nthcdr n source)))
               (if (consp rest)
                   (rec rest (cons (subseq source 0 n) acc))
                   (nreverse (cons source acc))))))
    (if source (rec source nil) nil)))

(defun keta (num)
  (let ((x (if (< num 0) (- num) num)))
    (labels ((f (x acc) (if (< x 10) acc (f (truncate x 10) (1+ acc)))))
      (f x 1))))

(defun flatten (lst)
  (labels ((rec (lst acc)
             (cond ((null lst) acc)
                   ((atom lst) (cons lst acc))
                   (t (rec (car lst) (rec (cdr lst) acc))))))
    (rec lst nil)))

(defmacro mac (expr)
  `(pprint (macroexpand-1 ',expr)))

(defun relist (from to)
  (loop for i from from to to collect i))

(defun remmul (lst num)
  (remove-if (lambda (lst) (= 0 (mod lst num))) lst))

(defun hurui (x)
  (if (null x)
      ()
      (cons (car x) (hurui (remmul (cdr x) (car x))))))

(defmacro fromto ((var from to &optional by) &body body)
  `(loop for ,var from ,from to ,to by (or ,by 1) do ,@body))

(defmacro frombel ((var from below &optional by) &body body)
  `(loop for ,var from ,from below ,below by (or ,by 1) do ,@body))

(defmacro for ((var from test &optional by) &body body)
  `(loop for ,var from ,from by (or ,by 1) unless ,test return nil
         do ,@body))

(defmacro let1 ((arg val) &body body)
  `(let ((,arg ,val))
     ,@body))

(defun closure-counter (add)
  (let ((acc 0))
    (lambda () (setf acc (+ add acc)))))

(defmacro case-equal (exp &body clauses)
  (let ((temp (gensym)))
    `(let ((,temp ,exp))
       (cond ,@(mapcar
                 (lambda (clause)
                   (destructuring-bind (keys . clause-forms) clause
                     (cond ((eq keys 'otherwise)
                            `(t ,@clause-forms))
                           (t
                            (if (atom keys) (setq keys (list keys)))
                            `((member ,temp ',keys :test #'equal)
                              ,@clause-forms)))))
                 clauses)))))

;switch仕様 下から2番目を追加しただけ
(defmacro switch-cond (&rest clauses)
  (if (endp clauses)
      nil
      (let ((clause (first clauses)))
        (when (atom clause)
          (error "Cond clause is not a list: ~S." clause))
        (let ((test (first clause))
              (forms (rest clause)))
          (if (endp forms)
              (let ((n-result (gensym)))
                `(let ((,n-result ,test))
                   (if ,n-result
                       ,n-result
                       (cond ,@(rest clauses)))))
              `(if ,test
                   (progn ,@forms
                          (cond ,@(rest clauses)))
                   (cond ,@(rest clauses))))))))

;文字列から全角を含めたスペースを削除する
(defun rm-space (char)
  (remove #\ideographic_space (remove #\space char)))

;テキストファイルを読み込みとき便利
(defun readlinefile (filename)
  (with-open-file
    (s filename :direction :input :external-format :utf-8)
    (loop :for line := (read-line s nil)
          :while line :collect line)))

;コンフィグファイルを読み込むときの一例
;(defun readconfig (filename)
;  (loop for i in (readlinefile filename) do
;        (let* ((l (split-sequence:split-sequence #\= i))
;               (a (read-from-string
;                    (concatenate 'string "*" (car l) "*")))
;               (b (second l)))
;          (eval `(defparameter ,a (read-from-string ,b))))))

;テスト関数を複数の条件で使える
(defun tests (fnc &rest objs)
  (if (< (length objs) 2) (error "function tests error"))
  (labels ((e (obj0 obj)
             (if (not obj) t
                 (and (funcall fnc obj0 (car obj)) (e obj0 (cdr obj))))))
    (e (car objs) (cdr objs))))

(defun eqs (&rest objs)
  (apply #'tests #'eq objs))

(defun splitp (num div)
  (zerop (mod num div)))

;変数の値を入れ替える
(defmacro swap! (var1 var2)
  (let ((tmp (gensym)))
    `(let ((,tmp ,var1))
       (setf ,var1 ,var2)
       (setf ,var2 ,tmp))))

(defun opposite (x)
  (* x -1)) 

(defmacro defparameters (&rest vars)
  `(progn
     ,@(mapcar #'(lambda (pair)
                   `(defparameter ,@pair))
               (group vars 2))))

(defmacro defparameternils (&rest vars)
  `(progn
     ,@(mapcar (lambda (var)
                 `(defparameter ,var nil)) vars)))

(defmacro setfs (&rest vars)
  `(progn
     ,@(mapcar (lambda (pair)
                 `(setf ,@pair))
               (group vars 2))))

(defun nthcar (n list)
  (reverse (last (reverse list) n)))

(defmacro gethashes (var &rest keyandvals)
  `(progn ,@(mapcar (lambda (pair)
                      `(setf (gethash ,(car pair) ,var) ,(cadr pair)))
                    (group keyandvals 2))))

(defun concatenate-symbol (&rest syms)
  (read-from-string
    (apply #'concatenate 'string (mapcar #'string syms))))

(defun dig (x lst)
  (cond
    ((null lst) nil)
    ((eq x (car lst)) (dig x (cdr lst)))
    (t lst)))

;Binary Number List
(defun bnl-1- (lst)
  (labels ((f (l) (cond ((eq (car l) 0) (cons 1 (f (cdr l))))
                        ((eq (car l) 1) (cons 0 (cdr l))))))
    (if (not (remove 0 lst)) '(0)
        (dig 0 (reverse (f (reverse lst)))))))

(defun bnl-1+ (lst)
  (labels ((f (l) (cond ((eq (car l) 1) (cons 0 (f (cdr l))))
                        ((eq (car l) 0) (cons 1 (cdr l))))))
    (dig 0 (reverse (f (reverse (cons 0 lst)))))))

(defun bnl-sft (x lst)
  (cond ((< x 0) (bnl-sft (1+ x) (bnl-1- lst)))
        ((> x 0) (bnl-sft (1- x) (bnl-1+ lst)))
        ((= x 0) lst)))

(defun bnl-eval (lst)
  (if (not (remove 0 lst)) 0
      (1+ (bnl-eval (bnl-1- lst)))))

(defun bnl-inteval (int)
  (bnl-eval (numtolist int)))

(defun dig (x lst)
  (if (not (eq x (car lst)))
      lst
      (dig x (cdr lst))))

(defun lstminnum (lst)
  (labels
    ((f (lst min turn r)
       (cond ((not lst) r)
             ((<= min (car lst)) (f (cdr lst) min (1+ turn) r))
             (t (f (cdr lst) (car lst) (1+ turn) turn)))))
    (f lst (car lst) 0 0)))

(defun min-kobaisu (lst)
  (labels
    ((f (lst old)
       (if (apply #'= lst) (car lst)
           (let ((minnm (lstminnum lst)))
             (progn
               (print lst)
               (f  (append (subseq lst 0 minnm)
                           (list (+ (nth minnm lst) (nth minnm old)))
                           (nthcdr (1+ minnm) lst)) old))))))
    (f lst lst)))

(defun recip (x) (expt x -1))

(defun st (lst f)
  (sort (copy-list lst) f))

(defun sortp (lst f)
  (equal (st lst f) lst))

(defun bogo (lst f)
  (if (eq f #'<) (setf f #'<=))
  (if (eq f #'>) (setf f #'>=))
  (let ((x (random-list lst)))
    (if (apply f x)
        x
        (bogo lst f))))

(defun tarai (x y z)
  (if (<= x y)
      y
      (tarai (tarai (1- x) y z)
             (tarai (1- y) z x)
             (tarai (1- z) x y))))

(defun make-toggle (x &rest y)
  (lambda (&rest toggle?)
    (if toggle?
        (let ((temp x))
          (setf x (car y))
          (setf y (append (cdr y) (list temp)))
          x)
        x)))

(defun iota (x)
  (loop for i from 0 below x collect i))

(defun bub (lst)
  (loop for i below (length lst) do
        (loop for n from (1+ i) below (length lst) do
              (if (> (nth i lst) (nth n lst))
                  (rotatef (nth i lst) (nth n lst)))))
  lst)
