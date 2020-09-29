(format T "~{~A~^, ~}~%"
        (loop for i from 2 to 100
              if (loop for j from 2 to (- i 1)
                       never (= 0 (rem i j)))
              collect i))