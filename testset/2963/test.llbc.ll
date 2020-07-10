; ModuleID = 'test.llbc'
source_filename = "/data/home/yizhuo/UBIAnalysis/unittest/2963/test.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.video_code = type { [16 x i8], i32, i8* }
%struct.video_code32 = type { [16 x i8], i32, i32 }
%union.anon = type { %struct.video_tuner }
%struct.video_tuner = type { i32, [32 x i8], i64, i64, i32, i16, i16 }

@cmd = global i32 1, align 4

; Function Attrs: nounwind uwtable
define i64 @copy_from_user(i8* %to, i8* %from, i64 %n) #0 {
test.bc-copy_from_user-0:
  %0 = alloca i8*, align 8
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %to, i8** %0, align 8
  store i8* %from, i8** %1, align 8
  store i64 %n, i64* %2, align 8
  ret i64 0
}

; Function Attrs: nounwind uwtable
define void @get_microcode32(%struct.video_code* %kp, %struct.video_code32* %up) #0 {
test.bc-get_microcode32-0:
  %0 = alloca %struct.video_code*, align 8
  %1 = alloca %struct.video_code32*, align 8
  store %struct.video_code* %kp, %struct.video_code** %0, align 8
  store %struct.video_code32* %up, %struct.video_code32** %1, align 8
  %2 = load %struct.video_code*, %struct.video_code** %0, align 8
  %3 = getelementptr inbounds %struct.video_code, %struct.video_code* %2, i32 0, i32 2
  %4 = load i8*, i8** %3, align 8
  %5 = load %struct.video_code32*, %struct.video_code32** %1, align 8
  %6 = getelementptr inbounds %struct.video_code32, %struct.video_code32* %5, i32 0, i32 2
  %7 = load i32, i32* %6, align 4
  %8 = zext i32 %7 to i64
  %9 = inttoptr i64 %8 to i8*
  %10 = load %struct.video_code32*, %struct.video_code32** %1, align 8
  %11 = getelementptr inbounds %struct.video_code32, %struct.video_code32* %10, i32 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = sext i32 %12 to i64
  %14 = call i64 @copy_from_user(i8* %4, i8* %9, i64 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @caller(i64 %arg) #0 {
test.bc-caller-0:
  %0 = alloca i64, align 8
  %karg = alloca %union.anon, align 8
  %up = alloca i8*, align 8
  store i64 %arg, i64* %0, align 8
  %1 = load i64, i64* %0, align 8
  %2 = trunc i64 %1 to i32
  %3 = call i8* @compat_ptr(i32 %2)
  store i8* %3, i8** %up, align 8
  %4 = load i32, i32* @cmd, align 4
  switch i32 %4, label %test.bc-caller-2 [
    i32 1, label %test.bc-caller-1
  ]

test.bc-caller-1:                                 ; preds = %test.bc-caller-0
  %5 = bitcast %union.anon* %karg to %struct.video_code*
  %6 = load i8*, i8** %up, align 8
  %7 = bitcast i8* %6 to %struct.video_code32*
  call void @get_microcode32(%struct.video_code* %5, %struct.video_code32* %7)
  br label %test.bc-caller-2

test.bc-caller-2:                                 ; preds = %test.bc-caller-1, %test.bc-caller-0
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i8* @compat_ptr(i32 %uptr) #1 {
test.bc-compat_ptr-0:
  %0 = alloca i32, align 4
  store i32 %uptr, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = zext i32 %1 to i64
  %3 = inttoptr i64 %2 to i8*
  ret i8* %3
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
