; ModuleID = 'test.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.nf_conntrack_helper = type { %struct.nf_conntrack_tuple, i32 }
%struct.nf_conntrack_tuple = type { %struct.nf_conntrack_man, %struct.anon }
%struct.nf_conntrack_man = type { i32 }
%struct.anon = type { i32, i32 }
%struct.nlattr = type { i16, i16 }

; Function Attrs: norecurse nounwind readnone uwtable
define i32 @nf_conntrack_helper_register(%struct.nf_conntrack_helper* readnone %me) #0 {
  %1 = icmp eq %struct.nf_conntrack_helper* %me, null
  %. = select i1 %1, i32 1, i32 -1
  ret i32 %.
}

; Function Attrs: nounwind uwtable
define i32 @nfnl_cthelper_create(%struct.nlattr** nocapture readonly %tb, %struct.nf_conntrack_tuple* nocapture readonly %tuple) #1 {
  %1 = getelementptr inbounds %struct.nlattr*, %struct.nlattr** %tb, i64 2
  %2 = load %struct.nlattr*, %struct.nlattr** %1, align 8
  %3 = icmp eq %struct.nlattr* %2, null
  br i1 %3, label %10, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call noalias i8* @malloc(i64 32) #5
  %6 = getelementptr inbounds i8, i8* %5, i64 16
  %7 = bitcast i8* %6 to %struct.nf_conntrack_helper*
  %8 = bitcast %struct.nf_conntrack_tuple* %tuple to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %8, i64 12, i32 4, i1 false)
  %9 = tail call i32 @nf_conntrack_helper_register(%struct.nf_conntrack_helper* %7)
  br label %10

; <label>:10                                      ; preds = %0, %4
  %.0 = phi i32 [ %9, %4 ], [ -22, %0 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: norecurse nounwind uwtable
define i32 @nfnl_cthelper_parse_tuple(%struct.nf_conntrack_tuple* nocapture %tuple, %struct.nlattr* nocapture readnone %attr) #4 {
  %1 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %tuple, i64 0, i32 0, i32 0
  store i32 4, i32* %1, align 4
  %2 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %tuple, i64 0, i32 1, i32 0
  store i32 4, i32* %2, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @nfnl_cthelper_new(%struct.nlattr** nocapture readonly %tb) #1 {
  %tuple = alloca %struct.nf_conntrack_tuple, align 4
  %1 = call i32 @nfnl_cthelper_parse_tuple(%struct.nf_conntrack_tuple* nonnull %tuple, %struct.nlattr* undef)
  %2 = call i32 @nfnl_cthelper_create(%struct.nlattr** %tb, %struct.nf_conntrack_tuple* nonnull %tuple)
  ret i32 %2
}

attributes #0 = { norecurse nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
