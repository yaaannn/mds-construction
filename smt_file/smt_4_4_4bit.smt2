(set-logic QF_BV)
(declare-fun a1 () (_ BitVec 4))
(declare-fun a2 () (_ BitVec 4))
(declare-fun a3 () (_ BitVec 4))
(declare-fun a4 () (_ BitVec 4))
(declare-fun a5 () (_ BitVec 4))
(declare-fun a6 () (_ BitVec 4))
(declare-fun a7 () (_ BitVec 4))
(declare-fun a8 () (_ BitVec 4))
(assert (or (= a1 #b0000) (= a1 #b0001) (= a1 #b1110)));
(assert (or (= a2 #b0000) (= a2 #b0001) (= a2 #b1110)));
(assert (or (= a3 #b0000) (= a3 #b0001) (= a3 #b1110)));
(assert (or (= a4 #b0000) (= a4 #b0001) (= a4 #b1110)));
(assert (or (= a5 #b0000) (= a5 #b0001) (= a5 #b1110)));
(assert (or (= a6 #b0000) (= a6 #b0001) (= a6 #b1110)));
(assert (or (= a7 #b0000) (= a7 #b0001) (= a7 #b1110)));
(assert (or (= a8 #b0000) (= a8 #b0001) (= a8 #b1110)));

(define-fun lut ((x (_ BitVec 4))) (_ BitVec 4)
  (ite (= x #b0000) #b0001
  (ite (= x #b0001) #b0010
  (ite (= x #b0010) #b0100
  (ite (= x #b0011) #b1000
  (ite (= x #b0100) #b0011
  (ite (= x #b0101) #b0110
  (ite (= x #b0110) #b1100
  (ite (= x #b0111) #b1011
  (ite (= x #b1000) #b0101
  (ite (= x #b1001) #b1010
  (ite (= x #b1010) #b0111
  (ite (= x #b1011) #b1110
  (ite (= x #b1100) #b1111
  (ite (= x #b1101) #b1101
  (ite (= x #b1110) #b1001
       #b0000))))))))))))))))

(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a6) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a5) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a6) (concat #x0 a8)) #x0F)))))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a4) (concat #x0 a6) (concat #x0 a7)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a8)) #x0F))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (concat #x0 a2) #x0F)) ((_ extract 3 0) (bvsrem (concat #x0 a6) #x0F))))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a4) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a8) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a4) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a5) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) #b0001)))))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a7)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a6) (concat #x0 a7)) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a4) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a7) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F)))))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a4) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a7) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a7) (concat #x0 a8)) #x0F)))))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (concat #x0 a1) #x0F)) ((_ extract 3 0) (bvsrem (concat #x0 a5) #x0F))))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a6)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a2) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a6) #x0F))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a4) (concat #x0 a7)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a7) (concat #x0 a8)) #x0F))))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (concat #x0 a3) #x0F)) ((_ extract 3 0) (bvsrem (concat #x0 a7) #x0F))))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a6) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a5) (concat #x0 a7)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a6) (concat #x0 a7)) #x0F)))))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a8)) #x0F)))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a4) (concat #x0 a6)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a7)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a7)) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a6) (concat #x0 a8)) #x0F))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a4) (concat #x0 a5) (concat #x0 a7)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a3) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a7) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a1) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a5) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a3) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a7) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a7)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a6) (concat #x0 a7)) #x0F)))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a6) (concat #x0 a8)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a4)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a8)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a6) (concat #x0 a8)) #x0F)))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a3) (concat #x0 a5) (concat #x0 a6) (concat #x0 a8)) #x0F)) #b0000))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a2)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a6)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a5)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a6)) #x0F))))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (concat #x0 a4) #x0F)) ((_ extract 3 0) (bvsrem (concat #x0 a8) #x0F))))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a1) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a5) #x0F))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a2) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a6) #x0F))))) #b0000)))
(assert (distinct ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a2) (concat #x0 a3) (concat #x0 a5) (concat #x0 a8)) #x0F)) #b0000))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3) (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a3)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a1) (concat #x0 a7)) #x0F))) (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a5) (concat #x0 a7)) #x0F)))))) #b0000)))
(assert (not (= (bvxor (lut ((_ extract 3 0) (bvsrem (bvadd (concat #x0 a4) (concat #x0 a5) (concat #x0 a6) (concat #x0 a7) (concat #x0 a8)) #x0F))) (bvxor (lut ((_ extract 3 0) (bvsrem (concat #x0 a4) #x0F))) (lut ((_ extract 3 0) (bvsrem (concat #x0 a8) #x0F))))) #b0000)))
(check-sat)
(get-model)
(get-info :all-statistics)
