; ModuleID = './built-in.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.power_supply = type { i8*, %struct.device }
%struct.device = type { %struct.device*, %struct.kobject }
%struct.kobject = type { i8*, %struct.kref, %struct.atomic_t, i8 }
%struct.kref = type { %struct.refcount_struct }
%struct.refcount_struct = type { %struct.atomic_t }
%struct.atomic_t = type { i32 }

@a = dso_local global i32 1, align 4, !dbg !0
@init = common dso_local global %struct.power_supply zeroinitializer, align 8, !dbg !6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @refcount_dec_and_test(%struct.refcount_struct* %r) #0 !dbg !47 {
est.bc-refcount_dec_and_test-0:
  %r.addr = alloca %struct.refcount_struct*, align 8
  store %struct.refcount_struct* %r, %struct.refcount_struct** %r.addr, align 8
  %0 = load %struct.refcount_struct*, %struct.refcount_struct** %r.addr, align 8, !dbg !51
  %refs = getelementptr inbounds %struct.refcount_struct, %struct.refcount_struct* %0, i32 0, i32 0, !dbg !53
  %counter = getelementptr inbounds %struct.atomic_t, %struct.atomic_t* %refs, i32 0, i32 0, !dbg !54
  %1 = load i32, i32* %counter, align 4, !dbg !54
  %tobool = icmp ne i32 %1, 0, !dbg !51
  br i1 %tobool, label %est.bc-refcount_dec_and_test-1, label %est.bc-refcount_dec_and_test-2, !dbg !55

est.bc-refcount_dec_and_test-1:                   ; preds = %est.bc-refcount_dec_and_test-0
  br label %est.bc-refcount_dec_and_test-2, !dbg !56

est.bc-refcount_dec_and_test-2:                   ; preds = %est.bc-refcount_dec_and_test-1, %est.bc-refcount_dec_and_test-0
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @kobject_put(%struct.kobject* %kobj) #0 !dbg !59 {
est.bc-kobject_put-0:
  %kobj.addr = alloca %struct.kobject*, align 8
  store %struct.kobject* %kobj, %struct.kobject** %kobj.addr, align 8
  %0 = load %struct.kobject*, %struct.kobject** %kobj.addr, align 8, !dbg !63
  %tobool = icmp ne %struct.kobject* %0, null, !dbg !63
  br i1 %tobool, label %est.bc-kobject_put-1, label %est.bc-kobject_put-4, !dbg !65

est.bc-kobject_put-1:                             ; preds = %est.bc-kobject_put-0
  %1 = load %struct.kobject*, %struct.kobject** %kobj.addr, align 8, !dbg !66
  %state_initialized = getelementptr inbounds %struct.kobject, %struct.kobject* %1, i32 0, i32 3, !dbg !69
  %bf.load = load i8, i8* %state_initialized, align 8, !dbg !69
  %bf.clear = and i8 %bf.load, 1, !dbg !69
  %bf.cast = zext i8 %bf.clear to i32, !dbg !69
  %tobool1 = icmp ne i32 %bf.cast, 0, !dbg !66
  br i1 %tobool1, label %est.bc-kobject_put-3, label %est.bc-kobject_put-2, !dbg !70

est.bc-kobject_put-2:                             ; preds = %est.bc-kobject_put-1
  br label %est.bc-kobject_put-3, !dbg !71

est.bc-kobject_put-3:                             ; preds = %est.bc-kobject_put-2, %est.bc-kobject_put-1
  %2 = load %struct.kobject*, %struct.kobject** %kobj.addr, align 8, !dbg !73
  %kref = getelementptr inbounds %struct.kobject, %struct.kobject* %2, i32 0, i32 1, !dbg !74
  %call = call i32 @kref_put(%struct.kref* %kref), !dbg !75
  br label %est.bc-kobject_put-4, !dbg !76

est.bc-kobject_put-4:                             ; preds = %est.bc-kobject_put-3, %est.bc-kobject_put-0
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @kref_put(%struct.kref* %kref) #0 !dbg !78 {
est.bc-kref_put-0:
  %kref.addr = alloca %struct.kref*, align 8
  store %struct.kref* %kref, %struct.kref** %kref.addr, align 8
  %0 = load %struct.kref*, %struct.kref** %kref.addr, align 8, !dbg !82
  %refcount = getelementptr inbounds %struct.kref, %struct.kref* %0, i32 0, i32 0, !dbg !84
  %call = call i32 @refcount_dec_and_test(%struct.refcount_struct* %refcount), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %est.bc-kref_put-1, label %est.bc-kref_put-2, !dbg !86

est.bc-kref_put-1:                                ; preds = %est.bc-kref_put-0
  br label %est.bc-kref_put-2, !dbg !87

est.bc-kref_put-2:                                ; preds = %est.bc-kref_put-1, %est.bc-kref_put-0
  ret i32 0, !dbg !89
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @put_device(%struct.device* %dev) #0 !dbg !90 {
est.bc-put_device-0:
  %dev.addr = alloca %struct.device*, align 8
  store %struct.device* %dev, %struct.device** %dev.addr, align 8
  %0 = load %struct.device*, %struct.device** %dev.addr, align 8, !dbg !93
  %tobool = icmp ne %struct.device* %0, null, !dbg !93
  br i1 %tobool, label %est.bc-put_device-1, label %est.bc-put_device-2, !dbg !95

est.bc-put_device-1:                              ; preds = %est.bc-put_device-0
  %1 = load %struct.device*, %struct.device** %dev.addr, align 8, !dbg !96
  %kobj = getelementptr inbounds %struct.device, %struct.device* %1, i32 0, i32 1, !dbg !98
  call void @kobject_put(%struct.kobject* %kobj), !dbg !99
  br label %est.bc-put_device-2, !dbg !100

est.bc-put_device-2:                              ; preds = %est.bc-put_device-1, %est.bc-put_device-0
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @power_supply_put(%struct.power_supply* %psy) #0 !dbg !102 {
est.bc-power_supply_put-0:
  %psy.addr = alloca %struct.power_supply*, align 8
  store %struct.power_supply* %psy, %struct.power_supply** %psy.addr, align 8
  %0 = load %struct.power_supply*, %struct.power_supply** %psy.addr, align 8, !dbg !106
  %dev = getelementptr inbounds %struct.power_supply, %struct.power_supply* %0, i32 0, i32 1, !dbg !107
  call void @put_device(%struct.device* %dev), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f() #0 !dbg !110 {
est.bc-f-0:
  %psy = alloca %struct.power_supply*, align 8
  %0 = load i32, i32* @a, align 4, !dbg !113
  %cmp = icmp eq i32 %0, 1, !dbg !115
  br i1 %cmp, label %est.bc-f-1, label %est.bc-f-2, !dbg !116

est.bc-f-1:                                       ; preds = %est.bc-f-0
  br label %est.bc-f-3, !dbg !117

est.bc-f-2:                                       ; preds = %est.bc-f-0
  store %struct.power_supply* @init, %struct.power_supply** %psy, align 8, !dbg !119
  br label %est.bc-f-3, !dbg !120

est.bc-f-3:                                       ; preds = %est.bc-f-2, %est.bc-f-1
  %1 = load %struct.power_supply*, %struct.power_supply** %psy, align 8, !dbg !121
  call void @power_supply_put(%struct.power_supply* %1), !dbg !122
  ret i32 0, !dbg !123
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!2}
!llvm.ident = !{!43}
!llvm.module.flags = !{!44, !45, !46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 2, type: !36, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5)
!3 = !DIFile(filename: "test.c", directory: "/home/yizhuo/And-UBITect/testset/123c")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "init", scope: !2, file: !3, line: 31, type: !8, isLocal: false, isDefinition: true)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "power_supply", file: !3, line: 27, size: 320, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "drv_data", scope: !8, file: !3, line: 28, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "dev", scope: !8, file: !3, line: 29, baseType: !13, size: 256, offset: 64)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "device", file: !3, line: 23, size: 256, elements: !14)
!14 = !{!15, !17}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !13, file: !3, line: 24, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "kobj", scope: !13, file: !3, line: 25, baseType: !18, size: 192, offset: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "kobject", file: !3, line: 16, size: 192, elements: !19)
!19 = !{!20, !24, !37, !41}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !18, file: !3, line: 18, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "kref", scope: !18, file: !3, line: 19, baseType: !25, size: 32, offset: 64)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "kref", file: !3, line: 13, size: 32, elements: !26)
!26 = !{!27}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "refcount", scope: !25, file: !3, line: 14, baseType: !28, size: 32)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "refcount_t", file: !3, line: 12, baseType: !29)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "refcount_struct", file: !3, line: 10, size: 32, elements: !30)
!30 = !{!31}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "refs", scope: !29, file: !3, line: 11, baseType: !32, size: 32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "atomic_t", file: !3, line: 9, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 7, size: 32, elements: !34)
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "counter", scope: !33, file: !3, line: 8, baseType: !36, size: 32)
!36 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "release", scope: !18, file: !3, line: 20, baseType: !38, size: 32, offset: 96)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "delayed_work", file: !3, line: 4, size: 32, elements: !39)
!39 = !{!40}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "cpu", scope: !38, file: !3, line: 5, baseType: !36, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "state_initialized", scope: !18, file: !3, line: 21, baseType: !42, size: 1, offset: 128, flags: DIFlagBitField, extraData: i64 128)
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!44 = !{i32 2, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = distinct !DISubprogram(name: "refcount_dec_and_test", scope: !3, file: !3, line: 32, type: !48, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!36, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!51 = !DILocation(line: 34, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !3, line: 34, column: 5)
!53 = !DILocation(line: 34, column: 8, scope: !52)
!54 = !DILocation(line: 34, column: 13, scope: !52)
!55 = !DILocation(line: 34, column: 5, scope: !47)
!56 = !DILocation(line: 37, column: 2, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !3, line: 35, column: 2)
!58 = !DILocation(line: 38, column: 2, scope: !47)
!59 = distinct !DISubprogram(name: "kobject_put", scope: !3, file: !3, line: 47, type: !60, isLocal: false, isDefinition: true, scopeLine: 48, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{null, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!63 = !DILocation(line: 49, column: 5, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !3, line: 49, column: 5)
!65 = !DILocation(line: 49, column: 5, scope: !59)
!66 = !DILocation(line: 51, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !3, line: 51, column: 6)
!68 = distinct !DILexicalBlock(scope: !64, file: !3, line: 50, column: 2)
!69 = !DILocation(line: 51, column: 13, scope: !67)
!70 = !DILocation(line: 51, column: 6, scope: !68)
!71 = !DILocation(line: 53, column: 3, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 52, column: 3)
!73 = !DILocation(line: 54, column: 13, scope: !68)
!74 = !DILocation(line: 54, column: 19, scope: !68)
!75 = !DILocation(line: 54, column: 3, scope: !68)
!76 = !DILocation(line: 55, column: 2, scope: !68)
!77 = !DILocation(line: 56, column: 1, scope: !59)
!78 = distinct !DISubprogram(name: "kref_put", scope: !3, file: !3, line: 40, type: !79, isLocal: true, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!36, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!82 = !DILocation(line: 42, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !3, line: 42, column: 5)
!84 = !DILocation(line: 42, column: 34, scope: !83)
!85 = !DILocation(line: 42, column: 5, scope: !83)
!86 = !DILocation(line: 42, column: 5, scope: !78)
!87 = !DILocation(line: 44, column: 2, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !3, line: 43, column: 2)
!89 = !DILocation(line: 45, column: 2, scope: !78)
!90 = distinct !DISubprogram(name: "put_device", scope: !3, file: !3, line: 57, type: !91, isLocal: false, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{null, !16}
!93 = !DILocation(line: 60, column: 6, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 60, column: 6)
!95 = !DILocation(line: 60, column: 6, scope: !90)
!96 = !DILocation(line: 61, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 60, column: 10)
!98 = !DILocation(line: 61, column: 21, scope: !97)
!99 = !DILocation(line: 61, column: 3, scope: !97)
!100 = !DILocation(line: 62, column: 2, scope: !97)
!101 = !DILocation(line: 63, column: 1, scope: !90)
!102 = distinct !DISubprogram(name: "power_supply_put", scope: !3, file: !3, line: 64, type: !103, isLocal: false, isDefinition: true, scopeLine: 64, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!103 = !DISubroutineType(types: !104)
!104 = !{null, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!106 = !DILocation(line: 65, column: 14, scope: !102)
!107 = !DILocation(line: 65, column: 19, scope: !102)
!108 = !DILocation(line: 65, column: 2, scope: !102)
!109 = !DILocation(line: 66, column: 1, scope: !102)
!110 = distinct !DISubprogram(name: "f", scope: !3, file: !3, line: 67, type: !111, isLocal: false, isDefinition: true, scopeLine: 67, isOptimized: false, unit: !2, retainedNodes: !4)
!111 = !DISubroutineType(types: !112)
!112 = !{!36}
!113 = !DILocation(line: 69, column: 5, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !3, line: 69, column: 5)
!115 = !DILocation(line: 69, column: 7, scope: !114)
!116 = !DILocation(line: 69, column: 5, scope: !110)
!117 = !DILocation(line: 70, column: 3, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 69, column: 12)
!119 = !DILocation(line: 72, column: 6, scope: !110)
!120 = !DILocation(line: 72, column: 2, scope: !110)
!121 = !DILocation(line: 74, column: 19, scope: !110)
!122 = !DILocation(line: 74, column: 2, scope: !110)
!123 = !DILocation(line: 75, column: 2, scope: !110)
