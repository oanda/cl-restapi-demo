(require 'drakma)
(require 'cl-json)

(setq drakma:*text-content-types* (cons '("application" . "json")
                                        drakma:*text-content-types*))
(defvar *base-url* "http://api-sandbox.oanda.com")

(defun get-candles (&key pair days)
  (json:decode-json-from-string
   (drakma:http-request (concatenate 'string *base-url* "/v1/candles?instrument=" pair "&count=" (format nil "~S" days) "&granularity=D")
			:method :get)))

(defun get-average-price (&key pair days)
  (destructuring-bind (instrument granularity candles)
      (get-candles :pair pair :days days)
    (/ (loop for (time open-mid high-mid low-mid close-mid complete) in (cdr candles) 
	  sum (/ (+ (cdr high-mid) (cdr low-mid)) 2)) 
       (list-length (cdr candles)))))

;; get the 12 day average price of EUR/USD
(get-average-price :pair "EUR_USD" :days 12)