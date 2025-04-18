; ModuleID = 'E:\nxu16-dev\omfu8-test\main.cpp'
source_filename = "E:\\nxu16-dev\\omfu8-test\\main.cpp"
target datalayout = "e-m:e-p:24:16-p1:24:16-p2:16:16-i8:8-i16:16-i24:16-i32:16-i64:16-f32:16-f64:16-n8:16:32:64-a:16-a:0:8-S16"
target triple = "U16_U8CORE"

; Function Attrs: mustprogress noinline norecurse optnone
define dso_local noundef i16 @main() #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  store i16 0, ptr %1, align 2
  store i16 0, ptr %2, align 2
  br label %4

4:                                                ; preds = %12, %0
  %5 = load i16, ptr %2, align 2
  %6 = icmp ult i16 %5, 2048
  br i1 %6, label %7, label %15

7:                                                ; preds = %4
  %8 = load i16, ptr %2, align 2
  %9 = add i16 -2048, %8
  %10 = zext i16 %9 to i32
  %11 = inttoptr i32 %10 to ptr
  store i16 0, ptr %11, align 2
  br label %12

12:                                               ; preds = %7
  %13 = load i16, ptr %2, align 2
  %14 = add i16 %13, 1
  store i16 %14, ptr %2, align 2
  br label %4, !llvm.loop !3

15:                                               ; preds = %4
  store i16 0, ptr %3, align 2
  br label %16

16:                                               ; preds = %24, %15
  %17 = load i16, ptr %3, align 2
  %18 = icmp ult i16 %17, 7936
  br i1 %18, label %19, label %27

19:                                               ; preds = %16
  %20 = load i16, ptr %3, align 2
  %21 = add i16 -12288, %20
  %22 = zext i16 %21 to i32
  %23 = inttoptr i32 %22 to ptr
  store i16 0, ptr %23, align 2
  br label %24

24:                                               ; preds = %19
  %25 = load i16, ptr %3, align 2
  %26 = add i16 %25, 1
  store i16 %26, ptr %3, align 2
  br label %16, !llvm.loop !5

27:                                               ; preds = %16
  br label %28

28:                                               ; preds = %27, %28
  call void @FastRender(i16 noundef zeroext -10240)
  br label %28, !llvm.loop !6
}

declare dso_local void @FastRender(i16 noundef zeroext) #1

attributes #0 = { mustprogress noinline norecurse optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="-lapisomf,-type:ML620906" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="-lapisomf,-type:ML620906" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 1.30"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
