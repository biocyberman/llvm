; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -S -slp-vectorizer | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define <4 x i32> @zot() #0 {
; CHECK-LABEL: @zot(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[P0:%.*]] = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 0
; CHECK-NEXT:    [[P1:%.*]] = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 3
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[P0]] to <4 x i8>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i8>, <4 x i8>* [[TMP0]], align 1
; CHECK-NEXT:    [[TMP2:%.*]] = shufflevector <4 x i8> [[TMP1]], <4 x i8> undef, <4 x i32> <i32 1, i32 0, i32 2, i32 3>
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <4 x i8> [[TMP2]], i32 0
; CHECK-NEXT:    [[I0:%.*]] = insertelement <4 x i8> undef, i8 [[TMP3]], i32 0
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <4 x i8> [[TMP2]], i32 1
; CHECK-NEXT:    [[I1:%.*]] = insertelement <4 x i8> [[I0]], i8 [[TMP4]], i32 1
; CHECK-NEXT:    [[TMP5:%.*]] = extractelement <4 x i8> [[TMP2]], i32 2
; CHECK-NEXT:    [[I2:%.*]] = insertelement <4 x i8> [[I1]], i8 [[TMP5]], i32 2
; CHECK-NEXT:    [[TMP6:%.*]] = extractelement <4 x i8> [[TMP2]], i32 3
; CHECK-NEXT:    [[I3:%.*]] = insertelement <4 x i8> [[I2]], i8 [[TMP6]], i32 3
; CHECK-NEXT:    [[RET:%.*]] = zext <4 x i8> [[I3]] to <4 x i32>
; CHECK-NEXT:    ret <4 x i32> [[RET]]
;
bb:
  %p0 = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 0
  %p1 = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 1
  %p2 = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 2
  %p3 = getelementptr inbounds [4 x i8], [4 x i8]* undef, i64 undef, i64 3
  %v3 = load i8, i8* %p3, align 1
  %v2 = load i8, i8* %p2, align 1
  %v0 = load i8, i8* %p0, align 1
  %v1 = load i8, i8* %p1, align 1
  %i0 = insertelement <4 x i8> undef, i8 %v1, i32 0
  %i1 = insertelement <4 x i8> %i0, i8 %v0, i32 1
  %i2 = insertelement <4 x i8> %i1, i8 %v2, i32 2
  %i3 = insertelement <4 x i8> %i2, i8 %v3, i32 3
  %ret = zext <4 x i8> %i3 to <4 x i32>
  ret <4 x i32> %ret
}
