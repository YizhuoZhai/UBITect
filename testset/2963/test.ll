; ModuleID = 'test.bc'
source_filename = "test.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.video_code = type { [16 x i8], i32, i8* }
%struct.video_code32 = type { [16 x i8], i32, i32 }
%union.anon = type { %struct.video_tuner }
%struct.video_tuner = type { i32, [32 x i8], i64, i64, i32, i16, i16 }

@cmd = global i32 1, align 4

; Function Attrs: nounwind uwtable
define i64 @copy_from_user(i8* %to, i8* %from, i64 %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i8* %to, i8** %1, align 8
  store i8* %from, i8** %2, align 8
  store i64 %n, i64* %3, align 8
  ret i64 0
}

; Function Attrs: nounwind uwtable
define void @get_microcode32(%struct.video_code* %kp, %struct.video_code32* %up) #0 {
  %1 = alloca %struct.video_code*, align 8
  %2 = alloca %struct.video_code32*, align 8
  store %struct.video_code* %kp, %struct.video_code** %1, align 8
  store %struct.video_code32* %up, %struct.video_code32** %2, align 8
  %3 = load %struct.video_code*, %struct.video_code** %1, align 8
  %4 = getelementptr inbounds %struct.video_code, %struct.video_code* %3, i32 0, i32 2
  %5 = load i8*, i8** %4, align 8
  %6 = load %struct.video_code32*, %struct.video_code32** %2, align 8
  %7 = getelementptr inbounds %struct.video_code32, %struct.video_code32* %6, i32 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = zext i32 %8 to i64
  %10 = inttoptr i64 %9 to i8*
  %11 = load %struct.video_code32*, %struct.video_code32** %2, align 8
  %12 = getelementptr inbounds %struct.video_code32, %struct.video_code32* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = call i64 @copy_from_user(i8* %5, i8* %10, i64 %14)
  ret void
}

; Function Attrs: nounwind uwtable
define void @caller(i64 %arg) #0 {
  %1 = alloca i64, align 8
  %karg = alloca %union.anon, align 8
  %up = alloca i8*, align 8
  store i64 %arg, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = trunc i64 %2 to i32
  %4 = call i8* @compat_ptr(i32 %3)
  store i8* %4, i8** %up, align 8
  %5 = load i32, i32* @cmd, align 4
  switch i32 %5, label %10 [
    i32 1, label %6
  ]

; <label>:6:                                      ; preds = %0
  %7 = bitcast %union.anon* %karg to %struct.video_code*
  %8 = load i8*, i8** %up, align 8
  %9 = bitcast i8* %8 to %struct.video_code32*
  call void @get_microcode32(%struct.video_code* %7, %struct.video_code32* %9)
  br label %10

; <label>:10:                                     ; preds = %6, %0
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i8* @compat_ptr(i32 %uptr) #1 {
  %1 = alloca i32, align 4
  store i32 %uptr, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = zext i32 %2 to i64
  %4 = inttoptr i64 %3 to i8*
  ret i8* %4
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
