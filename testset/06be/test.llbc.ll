; ModuleID = 'test.llbc'
source_filename = "/data/home/yizhuo/UBIAnalysis/unittest/06be/test.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.nf_conntrack_tuple = type { %struct.nf_conntrack_man, %struct.anon }
%struct.nf_conntrack_man = type { i32, %union.nf_conntrack_man_proto }
%union.nf_conntrack_man_proto = type { i32 }
%struct.anon = type { i32, i32 }
%struct.nf_conntrack_helper = type { %struct.nf_conntrack_tuple, i32 }
%struct.nlattr = type { i16, i16 }
%struct.nfnl_cthelper = type { %struct.list_head, %struct.nf_conntrack_helper }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.nf_contrack_helper = type opaque

; Function Attrs: nounwind uwtable
define i32 @helper_hash(%struct.nf_conntrack_tuple* %tuple) #0 {
test.bc-helper_hash-0:
  %0 = alloca %struct.nf_conntrack_tuple*, align 8
  store %struct.nf_conntrack_tuple* %tuple, %struct.nf_conntrack_tuple** %0, align 8
  %1 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %0, align 8
  %2 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %1, i32 0, i32 0
  %3 = getelementptr inbounds %struct.nf_conntrack_man, %struct.nf_conntrack_man* %2, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = shl i32 %4, 8
  %6 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %0, align 8
  %7 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %6, i32 0, i32 1
  %8 = getelementptr inbounds %struct.anon, %struct.anon* %7, i32 0, i32 0
  %9 = load i32, i32* %8, align 4
  %10 = or i32 %5, %9
  %11 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %0, align 8
  %12 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %11, i32 0, i32 0
  %13 = getelementptr inbounds %struct.nf_conntrack_man, %struct.nf_conntrack_man* %12, i32 0, i32 1
  %14 = bitcast %union.nf_conntrack_man_proto* %13 to i32*
  %15 = load i32, i32* %14, align 4
  %16 = xor i32 %10, %15
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @nf_conntrack_helper_register(%struct.nf_conntrack_helper* %me) #0 {
test.bc-nf_conntrack_helper_register-0:
  %0 = alloca %struct.nf_conntrack_helper*, align 8
  %h = alloca i32, align 4
  store %struct.nf_conntrack_helper* %me, %struct.nf_conntrack_helper** %0, align 8
  %1 = load %struct.nf_conntrack_helper*, %struct.nf_conntrack_helper** %0, align 8
  %2 = getelementptr inbounds %struct.nf_conntrack_helper, %struct.nf_conntrack_helper* %1, i32 0, i32 0
  %3 = call i32 @helper_hash(%struct.nf_conntrack_tuple* %2)
  store i32 %3, i32* %h, align 4
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @nfnl_cthelper_create(%struct.nlattr** %tb, %struct.nf_conntrack_tuple* %tuple) #0 {
test.bc-nfnl_cthelper_create-0:
  %0 = alloca i32, align 4
  %1 = alloca %struct.nlattr**, align 8
  %2 = alloca %struct.nf_conntrack_tuple*, align 8
  %helper = alloca %struct.nf_conntrack_helper*, align 8
  %nfcth = alloca %struct.nfnl_cthelper*, align 8
  %ret = alloca i32, align 4
  store %struct.nlattr** %tb, %struct.nlattr*** %1, align 8
  store %struct.nf_conntrack_tuple* %tuple, %struct.nf_conntrack_tuple** %2, align 8
  %3 = load %struct.nlattr**, %struct.nlattr*** %1, align 8
  %4 = getelementptr inbounds %struct.nlattr*, %struct.nlattr** %3, i64 2
  %5 = load %struct.nlattr*, %struct.nlattr** %4, align 8
  %6 = icmp ne %struct.nlattr* %5, null
  br i1 %6, label %test.bc-nfnl_cthelper_create-2, label %test.bc-nfnl_cthelper_create-1

test.bc-nfnl_cthelper_create-1:                   ; preds = %test.bc-nfnl_cthelper_create-0
  store i32 -22, i32* %0, align 4
  br label %test.bc-nfnl_cthelper_create-3

test.bc-nfnl_cthelper_create-2:                   ; preds = %test.bc-nfnl_cthelper_create-0
  %7 = call noalias i8* @malloc(i64 40) #3
  %8 = bitcast i8* %7 to %struct.nfnl_cthelper*
  store %struct.nfnl_cthelper* %8, %struct.nfnl_cthelper** %nfcth, align 8
  %9 = load %struct.nfnl_cthelper*, %struct.nfnl_cthelper** %nfcth, align 8
  %10 = getelementptr inbounds %struct.nfnl_cthelper, %struct.nfnl_cthelper* %9, i32 0, i32 1
  store %struct.nf_conntrack_helper* %10, %struct.nf_conntrack_helper** %helper, align 8
  %11 = load %struct.nf_conntrack_helper*, %struct.nf_conntrack_helper** %helper, align 8
  %12 = getelementptr inbounds %struct.nf_conntrack_helper, %struct.nf_conntrack_helper* %11, i32 0, i32 0
  %13 = bitcast %struct.nf_conntrack_tuple* %12 to i8*
  %14 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %2, align 8
  %15 = bitcast %struct.nf_conntrack_tuple* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %15, i64 16, i32 4, i1 false)
  %16 = load %struct.nf_conntrack_helper*, %struct.nf_conntrack_helper** %helper, align 8
  %17 = call i32 @nf_conntrack_helper_register(%struct.nf_conntrack_helper* %16)
  store i32 %17, i32* %ret, align 4
  %18 = load i32, i32* %ret, align 4
  store i32 %18, i32* %0, align 4
  br label %test.bc-nfnl_cthelper_create-3

test.bc-nfnl_cthelper_create-3:                   ; preds = %test.bc-nfnl_cthelper_create-2, %test.bc-nfnl_cthelper_create-1
  %19 = load i32, i32* %0, align 4
  ret i32 %19
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @nfnl_cthelper_parse_tuple(%struct.nf_conntrack_tuple* %tuple, %struct.nlattr* %attr) #0 {
test.bc-nfnl_cthelper_parse_tuple-0:
  %0 = alloca %struct.nf_conntrack_tuple*, align 8
  %1 = alloca %struct.nlattr*, align 8
  store %struct.nf_conntrack_tuple* %tuple, %struct.nf_conntrack_tuple** %0, align 8
  store %struct.nlattr* %attr, %struct.nlattr** %1, align 8
  %2 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %0, align 8
  %3 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %2, i32 0, i32 0
  %4 = getelementptr inbounds %struct.nf_conntrack_man, %struct.nf_conntrack_man* %3, i32 0, i32 0
  store i32 4, i32* %4, align 4
  %5 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %0, align 8
  %6 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %5, i32 0, i32 1
  %7 = getelementptr inbounds %struct.anon, %struct.anon* %6, i32 0, i32 0
  store i32 4, i32* %7, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @nfnl_cthelper_new(%struct.nlattr** %tb) #0 {
test.bc-nfnl_cthelper_new-0:
  %0 = alloca %struct.nlattr**, align 8
  %tuple = alloca %struct.nf_conntrack_tuple, align 4
  %helper = alloca %struct.nf_contrack_helper*, align 8
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.nlattr** %tb, %struct.nlattr*** %0, align 8
  store %struct.nf_contrack_helper* null, %struct.nf_contrack_helper** %helper, align 8
  store i32 0, i32* %ret, align 4
  %1 = load %struct.nlattr**, %struct.nlattr*** %0, align 8
  %2 = getelementptr inbounds %struct.nlattr*, %struct.nlattr** %1, i64 2
  %3 = load %struct.nlattr*, %struct.nlattr** %2, align 8
  %4 = call i32 @nfnl_cthelper_parse_tuple(%struct.nf_conntrack_tuple* %tuple, %struct.nlattr* %3)
  store i32 %4, i32* %ret, align 4
  %5 = load %struct.nf_contrack_helper*, %struct.nf_contrack_helper** %helper, align 8
  %6 = icmp eq %struct.nf_contrack_helper* %5, null
  br i1 %6, label %test.bc-nfnl_cthelper_new-1, label %test.bc-nfnl_cthelper_new-2

test.bc-nfnl_cthelper_new-1:                      ; preds = %test.bc-nfnl_cthelper_new-0
  %7 = load %struct.nlattr**, %struct.nlattr*** %0, align 8
  %8 = call i32 @nfnl_cthelper_create(%struct.nlattr** %7, %struct.nf_conntrack_tuple* %tuple)
  store i32 %8, i32* %ret, align 4
  br label %test.bc-nfnl_cthelper_new-2

test.bc-nfnl_cthelper_new-2:                      ; preds = %test.bc-nfnl_cthelper_new-1, %test.bc-nfnl_cthelper_new-0
  %9 = load i32, i32* %ret, align 4
  ret i32 %9
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
