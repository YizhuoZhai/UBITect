; ModuleID = 'cve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aStruct = type { i32 }
%struct.test_struct = type { i32, i32 }

@cpg = common global %struct.aStruct* null, align 8
@init = common global %struct.test_struct* null, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %backlog = alloca %struct.test_struct*, align 8
  store i32 0, i32* %1, align 4
  %2 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8
  %3 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %2, i32 0, i32 0
  store i32 1, i32* %3, align 4
  %4 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8
  %5 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %4, i32 0, i32 0
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = load %struct.test_struct*, %struct.test_struct** @init, align 8
  store %struct.test_struct* %9, %struct.test_struct** %backlog, align 8
  br label %10

; <label>:10                                      ; preds = %8, %0
  %11 = load %struct.test_struct*, %struct.test_struct** %backlog, align 8
  %12 = getelementptr inbounds %struct.test_struct, %struct.test_struct* %11, i32 0, i32 0
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %10
  %16 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8
  %17 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %16, i32 0, i32 0
  store i32 0, i32* %17, align 4
  br label %18

; <label>:18                                      ; preds = %15, %10
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
