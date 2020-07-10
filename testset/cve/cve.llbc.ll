; ModuleID = 'cve.llbc'
source_filename = "/data/home/yizhuo/UBIAnalysis/unittest/cve/cve.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.aStruct = type { i32 }
%struct.test_struct = type { i32, i32 }

@cpg = common global %struct.aStruct* null, align 8
@init = common global %struct.test_struct* null, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
cve.bc-main-0:
  %0 = alloca i32, align 4
  %backlog = alloca %struct.test_struct*, align 8
  store i32 0, i32* %0, align 4
  %1 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8
  %2 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %1, i32 0, i32 0
  store i32 1, i32* %2, align 4
  %3 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8
  %4 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %cve.bc-main-1, label %cve.bc-main-2

cve.bc-main-1:                                    ; preds = %cve.bc-main-0
  %7 = load %struct.test_struct*, %struct.test_struct** @init, align 8
  store %struct.test_struct* %7, %struct.test_struct** %backlog, align 8
  br label %cve.bc-main-2

cve.bc-main-2:                                    ; preds = %cve.bc-main-1, %cve.bc-main-0
  %8 = load %struct.test_struct*, %struct.test_struct** %backlog, align 8
  %9 = getelementptr inbounds %struct.test_struct, %struct.test_struct* %8, i32 0, i32 0
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %cve.bc-main-3, label %cve.bc-main-4

cve.bc-main-3:                                    ; preds = %cve.bc-main-2
  %12 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8
  %13 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %12, i32 0, i32 0
  store i32 0, i32* %13, align 4
  br label %cve.bc-main-4

cve.bc-main-4:                                    ; preds = %cve.bc-main-3, %cve.bc-main-2
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
