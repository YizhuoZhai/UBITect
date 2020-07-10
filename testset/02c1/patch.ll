; ModuleID = 'patch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fib_result = type { %struct.fib_table* }
%struct.fib_table = type { i32 }

; Function Attrs: nounwind uwtable
define void @ip_route_input_slow() #0 {
  %res = alloca %struct.fib_result, align 8
  %1 = getelementptr inbounds %struct.fib_result, %struct.fib_result* %res, i32 0, i32 0
  store %struct.fib_table* null, %struct.fib_table** %1, align 8
  %2 = getelementptr inbounds %struct.fib_result, %struct.fib_result* %res, i32 0, i32 0
  %3 = load %struct.fib_table*, %struct.fib_table** %2, align 8
  %4 = icmp ne %struct.fib_table* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %5, %0
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
