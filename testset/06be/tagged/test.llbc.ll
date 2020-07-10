; ModuleID = 'test.llbc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.nf_conntrack_tuple = type { %struct.nf_conntrack_man, %struct.anon }
%struct.nf_conntrack_man = type { i32, %union.nf_conntrack_man_proto }
%union.nf_conntrack_man_proto = type { i32 }
%struct.anon = type { i32, i32 }
%struct.nf_conntrack_helper = type { %struct.nf_conntrack_tuple, i32 }
%struct.nlattr = type { i16, i16 }
%struct.nfnl_cthelper = type { %struct.list_head, %struct.nf_conntrack_helper }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.nf_contrack_helper = type opaque

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @helper_hash(%struct.nf_conntrack_tuple* %tuple) #0 !dbg !10 {
est.bc-helper_hash-0:
  %tuple.addr = alloca %struct.nf_conntrack_tuple*, align 8
  store %struct.nf_conntrack_tuple* %tuple, %struct.nf_conntrack_tuple** %tuple.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nf_conntrack_tuple** %tuple.addr, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %tuple.addr, align 8, !dbg !33
  %src = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %0, i32 0, i32 0, !dbg !34
  %l3num = getelementptr inbounds %struct.nf_conntrack_man, %struct.nf_conntrack_man* %src, i32 0, i32 0, !dbg !35
  %1 = load i32, i32* %l3num, align 4, !dbg !35
  %shl = shl i32 %1, 8, !dbg !36
  %2 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %tuple.addr, align 8, !dbg !37
  %dst = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %2, i32 0, i32 1, !dbg !38
  %protonum = getelementptr inbounds %struct.anon, %struct.anon* %dst, i32 0, i32 0, !dbg !39
  %3 = load i32, i32* %protonum, align 4, !dbg !39
  %or = or i32 %shl, %3, !dbg !40
  %4 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %tuple.addr, align 8, !dbg !41
  %src1 = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %4, i32 0, i32 0, !dbg !42
  %u = getelementptr inbounds %struct.nf_conntrack_man, %struct.nf_conntrack_man* %src1, i32 0, i32 1, !dbg !43
  %all = bitcast %union.nf_conntrack_man_proto* %u to i32*, !dbg !44
  %5 = load i32, i32* %all, align 4, !dbg !44
  %xor = xor i32 %or, %5, !dbg !45
  ret i32 %xor, !dbg !46
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nf_conntrack_helper_register(%struct.nf_conntrack_helper* %me) #0 !dbg !47 {
est.bc-nf_conntrack_helper_register-0:
  %me.addr = alloca %struct.nf_conntrack_helper*, align 8
  %h = alloca i32, align 4
  store %struct.nf_conntrack_helper* %me, %struct.nf_conntrack_helper** %me.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nf_conntrack_helper** %me.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %h, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load %struct.nf_conntrack_helper*, %struct.nf_conntrack_helper** %me.addr, align 8, !dbg !59
  %tuple = getelementptr inbounds %struct.nf_conntrack_helper, %struct.nf_conntrack_helper* %0, i32 0, i32 0, !dbg !60
  %call = call i32 @helper_hash(%struct.nf_conntrack_tuple* %tuple), !dbg !61
  store i32 %call, i32* %h, align 4, !dbg !58
  ret i32 1, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nfnl_cthelper_create(%struct.nlattr** %tb, %struct.nf_conntrack_tuple* %tuple) #0 !dbg !63 {
est.bc-nfnl_cthelper_create-0:
  %retval = alloca i32, align 4
  %tb.addr = alloca %struct.nlattr**, align 8
  %tuple.addr = alloca %struct.nf_conntrack_tuple*, align 8
  %helper = alloca %struct.nf_conntrack_helper*, align 8
  %nfcth = alloca %struct.nfnl_cthelper*, align 8
  %ret = alloca i32, align 4
  store %struct.nlattr** %tb, %struct.nlattr*** %tb.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nlattr*** %tb.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store %struct.nf_conntrack_tuple* %tuple, %struct.nf_conntrack_tuple** %tuple.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nf_conntrack_tuple** %tuple.addr, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %struct.nf_conntrack_helper** %helper, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.nfnl_cthelper** %nfcth, metadata !82, metadata !DIExpression()), !dbg !93
  %0 = load %struct.nlattr**, %struct.nlattr*** %tb.addr, align 8, !dbg !94
  %arrayidx = getelementptr inbounds %struct.nlattr*, %struct.nlattr** %0, i64 2, !dbg !94
  %1 = load %struct.nlattr*, %struct.nlattr** %arrayidx, align 8, !dbg !94
  %tobool = icmp ne %struct.nlattr* %1, null, !dbg !94
  br i1 %tobool, label %est.bc-nfnl_cthelper_create-2, label %est.bc-nfnl_cthelper_create-1, !dbg !96

est.bc-nfnl_cthelper_create-1:                    ; preds = %est.bc-nfnl_cthelper_create-0
  store i32 -22, i32* %retval, align 4, !dbg !97
  br label %est.bc-nfnl_cthelper_create-3, !dbg !97

est.bc-nfnl_cthelper_create-2:                    ; preds = %est.bc-nfnl_cthelper_create-0
  %call = call noalias i8* @malloc(i64 40) #4, !dbg !98
  %2 = bitcast i8* %call to %struct.nfnl_cthelper*, !dbg !98
  store %struct.nfnl_cthelper* %2, %struct.nfnl_cthelper** %nfcth, align 8, !dbg !99
  %3 = load %struct.nfnl_cthelper*, %struct.nfnl_cthelper** %nfcth, align 8, !dbg !100
  %helper1 = getelementptr inbounds %struct.nfnl_cthelper, %struct.nfnl_cthelper* %3, i32 0, i32 1, !dbg !101
  store %struct.nf_conntrack_helper* %helper1, %struct.nf_conntrack_helper** %helper, align 8, !dbg !102
  %4 = load %struct.nf_conntrack_helper*, %struct.nf_conntrack_helper** %helper, align 8, !dbg !103
  %tuple2 = getelementptr inbounds %struct.nf_conntrack_helper, %struct.nf_conntrack_helper* %4, i32 0, i32 0, !dbg !104
  %5 = bitcast %struct.nf_conntrack_tuple* %tuple2 to i8*, !dbg !105
  %6 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %tuple.addr, align 8, !dbg !106
  %7 = bitcast %struct.nf_conntrack_tuple* %6 to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %7, i64 16, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !107, metadata !DIExpression()), !dbg !108
  %8 = load %struct.nf_conntrack_helper*, %struct.nf_conntrack_helper** %helper, align 8, !dbg !109
  %call3 = call i32 @nf_conntrack_helper_register(%struct.nf_conntrack_helper* %8), !dbg !110
  store i32 %call3, i32* %ret, align 4, !dbg !108
  %9 = load i32, i32* %ret, align 4, !dbg !111
  store i32 %9, i32* %retval, align 4, !dbg !112
  br label %est.bc-nfnl_cthelper_create-3, !dbg !112

est.bc-nfnl_cthelper_create-3:                    ; preds = %est.bc-nfnl_cthelper_create-2, %est.bc-nfnl_cthelper_create-1
  %10 = load i32, i32* %retval, align 4, !dbg !113
  ret i32 %10, !dbg !113
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nfnl_cthelper_parse_tuple(%struct.nf_conntrack_tuple* %tuple, %struct.nlattr* %attr) #0 !dbg !114 {
est.bc-nfnl_cthelper_parse_tuple-0:
  %tuple.addr = alloca %struct.nf_conntrack_tuple*, align 8
  %attr.addr = alloca %struct.nlattr*, align 8
  store %struct.nf_conntrack_tuple* %tuple, %struct.nf_conntrack_tuple** %tuple.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nf_conntrack_tuple** %tuple.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store %struct.nlattr* %attr, %struct.nlattr** %attr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nlattr** %attr.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %tuple.addr, align 8, !dbg !121
  %src = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %0, i32 0, i32 0, !dbg !122
  %l3num = getelementptr inbounds %struct.nf_conntrack_man, %struct.nf_conntrack_man* %src, i32 0, i32 0, !dbg !123
  store i32 4, i32* %l3num, align 4, !dbg !124
  %1 = load %struct.nf_conntrack_tuple*, %struct.nf_conntrack_tuple** %tuple.addr, align 8, !dbg !125
  %dst = getelementptr inbounds %struct.nf_conntrack_tuple, %struct.nf_conntrack_tuple* %1, i32 0, i32 1, !dbg !126
  %protonum = getelementptr inbounds %struct.anon, %struct.anon* %dst, i32 0, i32 0, !dbg !127
  store i32 4, i32* %protonum, align 4, !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nfnl_cthelper_new(%struct.nlattr** %tb) #0 !dbg !130 {
est.bc-nfnl_cthelper_new-0:
  %tb.addr = alloca %struct.nlattr**, align 8
  %tuple = alloca %struct.nf_conntrack_tuple, align 4
  %helper = alloca %struct.nf_contrack_helper*, align 8
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.nlattr** %tb, %struct.nlattr*** %tb.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.nlattr*** %tb.addr, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %struct.nf_conntrack_tuple* %tuple, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata %struct.nf_contrack_helper** %helper, metadata !137, metadata !DIExpression()), !dbg !140
  store %struct.nf_contrack_helper* null, %struct.nf_contrack_helper** %helper, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !141, metadata !DIExpression()), !dbg !142
  store i32 0, i32* %ret, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !144
  %0 = load %struct.nlattr**, %struct.nlattr*** %tb.addr, align 8, !dbg !145
  %arrayidx = getelementptr inbounds %struct.nlattr*, %struct.nlattr** %0, i64 2, !dbg !145
  %1 = load %struct.nlattr*, %struct.nlattr** %arrayidx, align 8, !dbg !145
  %call = call i32 @nfnl_cthelper_parse_tuple(%struct.nf_conntrack_tuple* %tuple, %struct.nlattr* %1), !dbg !146
  store i32 %call, i32* %ret, align 4, !dbg !147
  %2 = load %struct.nf_contrack_helper*, %struct.nf_contrack_helper** %helper, align 8, !dbg !148
  %cmp = icmp eq %struct.nf_contrack_helper* %2, null, !dbg !150
  br i1 %cmp, label %est.bc-nfnl_cthelper_new-1, label %est.bc-nfnl_cthelper_new-2, !dbg !151

est.bc-nfnl_cthelper_new-1:                       ; preds = %est.bc-nfnl_cthelper_new-0
  %3 = load %struct.nlattr**, %struct.nlattr*** %tb.addr, align 8, !dbg !152
  %call1 = call i32 @nfnl_cthelper_create(%struct.nlattr** %3, %struct.nf_conntrack_tuple* %tuple), !dbg !154
  store i32 %call1, i32* %ret, align 4, !dbg !155
  br label %est.bc-nfnl_cthelper_new-2, !dbg !156

est.bc-nfnl_cthelper_new-2:                       ; preds = %est.bc-nfnl_cthelper_new-1, %est.bc-nfnl_cthelper_new-0
  %4 = load i32, i32* %ret, align 4, !dbg !157
  ret i32 %4, !dbg !158
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "test.c", directory: "/home/yizhuo/And-UBITect/testset/06be/tagged")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!10 = distinct !DISubprogram(name: "helper_hash", scope: !1, file: !1, line: 39, type: !11, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!4, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nf_conntrack_tuple", file: !1, line: 24, size: 128, elements: !16)
!16 = !{!17, !26}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "src", scope: !15, file: !1, line: 25, baseType: !18, size: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nf_conntrack_man", file: !1, line: 13, size: 64, elements: !19)
!19 = !{!20, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "l3num", scope: !18, file: !1, line: 14, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !18, file: !1, line: 15, baseType: !23, size: 32, offset: 32)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "nf_conntrack_man_proto", file: !1, line: 9, size: 32, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "all", scope: !23, file: !1, line: 11, baseType: !4, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "dst", scope: !15, file: !1, line: 33, baseType: !27, size: 64, offset: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !15, file: !1, line: 28, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "protonum", scope: !27, file: !1, line: 30, baseType: !21, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "dir", scope: !27, file: !1, line: 32, baseType: !21, size: 32, offset: 32)
!31 = !DILocalVariable(name: "tuple", arg: 1, scope: !10, file: !1, line: 39, type: !13)
!32 = !DILocation(line: 39, column: 59, scope: !10)
!33 = !DILocation(line: 41, column: 12, scope: !10)
!34 = !DILocation(line: 41, column: 19, scope: !10)
!35 = !DILocation(line: 41, column: 23, scope: !10)
!36 = !DILocation(line: 41, column: 29, scope: !10)
!37 = !DILocation(line: 41, column: 37, scope: !10)
!38 = !DILocation(line: 41, column: 44, scope: !10)
!39 = !DILocation(line: 41, column: 48, scope: !10)
!40 = !DILocation(line: 41, column: 35, scope: !10)
!41 = !DILocation(line: 42, column: 17, scope: !10)
!42 = !DILocation(line: 42, column: 24, scope: !10)
!43 = !DILocation(line: 42, column: 28, scope: !10)
!44 = !DILocation(line: 42, column: 30, scope: !10)
!45 = !DILocation(line: 41, column: 58, scope: !10)
!46 = !DILocation(line: 41, column: 2, scope: !10)
!47 = distinct !DISubprogram(name: "nf_conntrack_helper_register", scope: !1, file: !1, line: 48, type: !48, isLocal: false, isDefinition: true, scopeLine: 48, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!21, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nf_conntrack_helper", file: !1, line: 35, size: 160, elements: !52)
!52 = !{!53, !54}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !51, file: !1, line: 36, baseType: !15, size: 128)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !51, file: !1, line: 37, baseType: !4, size: 32, offset: 128)
!55 = !DILocalVariable(name: "me", arg: 1, scope: !47, file: !1, line: 48, type: !50)
!56 = !DILocation(line: 48, column: 62, scope: !47)
!57 = !DILocalVariable(name: "h", scope: !47, file: !1, line: 49, type: !4)
!58 = !DILocation(line: 49, column: 15, scope: !47)
!59 = !DILocation(line: 49, column: 32, scope: !47)
!60 = !DILocation(line: 49, column: 36, scope: !47)
!61 = !DILocation(line: 49, column: 19, scope: !47)
!62 = !DILocation(line: 50, column: 2, scope: !47)
!63 = distinct !DISubprogram(name: "nfnl_cthelper_create", scope: !1, file: !1, line: 52, type: !64, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!21, !66, !75}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nlattr", file: !1, line: 17, size: 32, elements: !71)
!71 = !{!72, !74}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "nla_len", scope: !70, file: !1, line: 18, baseType: !73, size: 16)
!73 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "nla_type", scope: !70, file: !1, line: 19, baseType: !73, size: 16, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!76 = !DILocalVariable(name: "tb", arg: 1, scope: !63, file: !1, line: 52, type: !66)
!77 = !DILocation(line: 52, column: 54, scope: !63)
!78 = !DILocalVariable(name: "tuple", arg: 2, scope: !63, file: !1, line: 53, type: !75)
!79 = !DILocation(line: 53, column: 35, scope: !63)
!80 = !DILocalVariable(name: "helper", scope: !63, file: !1, line: 55, type: !50)
!81 = !DILocation(line: 55, column: 30, scope: !63)
!82 = !DILocalVariable(name: "nfcth", scope: !63, file: !1, line: 56, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nfnl_cthelper", file: !1, line: 44, size: 320, elements: !85)
!85 = !{!86, !92}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !84, file: !1, line: 45, baseType: !87, size: 128)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "list_head", file: !1, line: 21, size: 128, elements: !88)
!88 = !{!89, !91}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !87, file: !1, line: 22, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !87, file: !1, line: 22, baseType: !90, size: 64, offset: 64)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "helper", scope: !84, file: !1, line: 46, baseType: !51, size: 160, offset: 128)
!93 = !DILocation(line: 56, column: 24, scope: !63)
!94 = !DILocation(line: 57, column: 7, scope: !95)
!95 = distinct !DILexicalBlock(scope: !63, file: !1, line: 57, column: 6)
!96 = !DILocation(line: 57, column: 6, scope: !63)
!97 = !DILocation(line: 58, column: 3, scope: !95)
!98 = !DILocation(line: 60, column: 10, scope: !63)
!99 = !DILocation(line: 60, column: 8, scope: !63)
!100 = !DILocation(line: 61, column: 12, scope: !63)
!101 = !DILocation(line: 61, column: 19, scope: !63)
!102 = !DILocation(line: 61, column: 9, scope: !63)
!103 = !DILocation(line: 62, column: 10, scope: !63)
!104 = !DILocation(line: 62, column: 18, scope: !63)
!105 = !DILocation(line: 62, column: 2, scope: !63)
!106 = !DILocation(line: 62, column: 25, scope: !63)
!107 = !DILocalVariable(name: "ret", scope: !63, file: !1, line: 63, type: !21)
!108 = !DILocation(line: 63, column: 6, scope: !63)
!109 = !DILocation(line: 63, column: 41, scope: !63)
!110 = !DILocation(line: 63, column: 12, scope: !63)
!111 = !DILocation(line: 65, column: 9, scope: !63)
!112 = !DILocation(line: 65, column: 2, scope: !63)
!113 = !DILocation(line: 66, column: 1, scope: !63)
!114 = distinct !DISubprogram(name: "nfnl_cthelper_parse_tuple", scope: !1, file: !1, line: 68, type: !115, isLocal: false, isDefinition: true, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!21, !75, !68}
!117 = !DILocalVariable(name: "tuple", arg: 1, scope: !114, file: !1, line: 68, type: !75)
!118 = !DILocation(line: 68, column: 58, scope: !114)
!119 = !DILocalVariable(name: "attr", arg: 2, scope: !114, file: !1, line: 68, type: !68)
!120 = !DILocation(line: 68, column: 87, scope: !114)
!121 = !DILocation(line: 70, column: 3, scope: !114)
!122 = !DILocation(line: 70, column: 10, scope: !114)
!123 = !DILocation(line: 70, column: 14, scope: !114)
!124 = !DILocation(line: 70, column: 20, scope: !114)
!125 = !DILocation(line: 71, column: 3, scope: !114)
!126 = !DILocation(line: 71, column: 10, scope: !114)
!127 = !DILocation(line: 71, column: 14, scope: !114)
!128 = !DILocation(line: 71, column: 23, scope: !114)
!129 = !DILocation(line: 73, column: 3, scope: !114)
!130 = distinct !DISubprogram(name: "nfnl_cthelper_new", scope: !1, file: !1, line: 75, type: !131, isLocal: false, isDefinition: true, scopeLine: 76, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !2)
!131 = !DISubroutineType(types: !132)
!132 = !{!21, !66}
!133 = !DILocalVariable(name: "tb", arg: 1, scope: !130, file: !1, line: 75, type: !66)
!134 = !DILocation(line: 75, column: 51, scope: !130)
!135 = !DILocalVariable(name: "tuple", scope: !130, file: !1, line: 77, type: !15)
!136 = !DILocation(line: 77, column: 28, scope: !130)
!137 = !DILocalVariable(name: "helper", scope: !130, file: !1, line: 78, type: !138)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DICompositeType(tag: DW_TAG_structure_type, name: "nf_contrack_helper", scope: !130, file: !1, line: 78, flags: DIFlagFwdDecl)
!140 = !DILocation(line: 78, column: 29, scope: !130)
!141 = !DILocalVariable(name: "ret", scope: !130, file: !1, line: 79, type: !21)
!142 = !DILocation(line: 79, column: 6, scope: !130)
!143 = !DILocalVariable(name: "i", scope: !130, file: !1, line: 79, type: !21)
!144 = !DILocation(line: 79, column: 15, scope: !130)
!145 = !DILocation(line: 81, column: 42, scope: !130)
!146 = !DILocation(line: 81, column: 8, scope: !130)
!147 = !DILocation(line: 81, column: 6, scope: !130)
!148 = !DILocation(line: 83, column: 5, scope: !149)
!149 = distinct !DILexicalBlock(scope: !130, file: !1, line: 83, column: 5)
!150 = !DILocation(line: 83, column: 12, scope: !149)
!151 = !DILocation(line: 83, column: 5, scope: !130)
!152 = !DILocation(line: 85, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !1, line: 84, column: 2)
!154 = !DILocation(line: 85, column: 9, scope: !153)
!155 = !DILocation(line: 85, column: 7, scope: !153)
!156 = !DILocation(line: 86, column: 2, scope: !153)
!157 = !DILocation(line: 88, column: 9, scope: !130)
!158 = !DILocation(line: 88, column: 2, scope: !130)
