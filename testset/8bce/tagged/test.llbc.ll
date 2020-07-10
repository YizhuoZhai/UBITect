; ModuleID = 'test.llbc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.acpi_device_info = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @acpi_get_object_info(i8** %handle, %struct.acpi_device_info** %return_buffer) #0 !dbg !15 {
est.bc-acpi_get_object_info-0:
  %retval = alloca i32, align 4
  %handle.addr = alloca i8**, align 8
  %return_buffer.addr = alloca %struct.acpi_device_info**, align 8
  %info = alloca %struct.acpi_device_info*, align 8
  %valid = alloca i32, align 4
  store i8** %handle, i8*** %handle.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %handle.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct.acpi_device_info** %return_buffer, %struct.acpi_device_info*** %return_buffer.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.acpi_device_info*** %return_buffer.addr, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = load i8**, i8*** %handle.addr, align 8, !dbg !32
  %tobool = icmp ne i8** %0, null, !dbg !32
  br i1 %tobool, label %est.bc-acpi_get_object_info-1, label %est.bc-acpi_get_object_info-2, !dbg !34

est.bc-acpi_get_object_info-1:                    ; preds = %est.bc-acpi_get_object_info-0
  %1 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %return_buffer.addr, align 8, !dbg !35
  %tobool1 = icmp ne %struct.acpi_device_info** %1, null, !dbg !35
  br i1 %tobool1, label %est.bc-acpi_get_object_info-3, label %est.bc-acpi_get_object_info-2, !dbg !36

est.bc-acpi_get_object_info-2:                    ; preds = %est.bc-acpi_get_object_info-1, %est.bc-acpi_get_object_info-0
  store i32 4097, i32* %retval, align 4, !dbg !37
  br label %est.bc-acpi_get_object_info-4, !dbg !37

est.bc-acpi_get_object_info-3:                    ; preds = %est.bc-acpi_get_object_info-1
  call void @llvm.dbg.declare(metadata %struct.acpi_device_info** %info, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call noalias i8* @malloc(i64 8) #3, !dbg !41
  %2 = bitcast i8* %call to %struct.acpi_device_info*, !dbg !41
  store %struct.acpi_device_info* %2, %struct.acpi_device_info** %info, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %valid, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %valid, align 4, !dbg !43
  %3 = load i32, i32* %valid, align 4, !dbg !44
  %4 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8, !dbg !45
  %valid2 = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %4, i32 0, i32 0, !dbg !46
  store i32 %3, i32* %valid2, align 4, !dbg !47
  %5 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8, !dbg !48
  %6 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %return_buffer.addr, align 8, !dbg !49
  store %struct.acpi_device_info* %5, %struct.acpi_device_info** %6, align 8, !dbg !50
  store i32 32, i32* %retval, align 4, !dbg !51
  br label %est.bc-acpi_get_object_info-4, !dbg !51

est.bc-acpi_get_object_info-4:                    ; preds = %est.bc-acpi_get_object_info-3, %est.bc-acpi_get_object_info-2
  %7 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %7, !dbg !52
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xgene_ahci_probe(i8** %handle) #0 !dbg !53 {
est.bc-xgene_ahci_probe-0:
  %handle.addr = alloca i8**, align 8
  %version = alloca i32, align 4
  %status = alloca i32, align 4
  %info = alloca %struct.acpi_device_info*, align 8
  store i8** %handle, i8*** %handle.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %handle.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %version, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 1, i32* %version, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata i32* %status, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata %struct.acpi_device_info** %info, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8**, i8*** %handle.addr, align 8, !dbg !64
  %call = call i32 @acpi_get_object_info(i8** %0, %struct.acpi_device_info** %info), !dbg !65
  store i32 %call, i32* %status, align 4, !dbg !66
  %1 = load i32, i32* %status, align 4, !dbg !67
  %tobool = icmp ne i32 %1, 0, !dbg !67
  br i1 %tobool, label %est.bc-xgene_ahci_probe-1, label %est.bc-xgene_ahci_probe-2, !dbg !69

est.bc-xgene_ahci_probe-1:                        ; preds = %est.bc-xgene_ahci_probe-0
  store i32 1, i32* %version, align 4, !dbg !70
  br label %est.bc-xgene_ahci_probe-2, !dbg !72

est.bc-xgene_ahci_probe-2:                        ; preds = %est.bc-xgene_ahci_probe-1, %est.bc-xgene_ahci_probe-0
  %2 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8, !dbg !73
  %valid = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %2, i32 0, i32 0, !dbg !75
  %3 = load i32, i32* %valid, align 4, !dbg !75
  %and = and i32 %3, 32, !dbg !76
  %tobool1 = icmp ne i32 %and, 0, !dbg !76
  br i1 %tobool1, label %est.bc-xgene_ahci_probe-3, label %est.bc-xgene_ahci_probe-4, !dbg !77

est.bc-xgene_ahci_probe-3:                        ; preds = %est.bc-xgene_ahci_probe-2
  store i32 2, i32* %version, align 4, !dbg !78
  br label %est.bc-xgene_ahci_probe-4, !dbg !80

est.bc-xgene_ahci_probe-4:                        ; preds = %est.bc-xgene_ahci_probe-3, %est.bc-xgene_ahci_probe-2
  %4 = load i32, i32* %version, align 4, !dbg !81
  ret i32 %4, !dbg !82
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !8)
!1 = !DIFile(filename: "test.c", directory: "/data/home/yizhuo/And-UBITect/testset/8bce")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xgene_ahci_version", file: !1, line: 8, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7}
!6 = !DIEnumerator(name: "XGENE_AHCI_V1", value: 1, isUnsigned: true)
!7 = !DIEnumerator(name: "XGENE_AHCI_V2", value: 2, isUnsigned: true)
!8 = !{!9}
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "acpi_status", file: !1, line: 3, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!15 = distinct !DISubprogram(name: "acpi_get_object_info", scope: !1, file: !1, line: 17, type: !16, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !27)
!16 = !DISubroutineType(types: !17)
!17 = !{!9, !18, !21}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "acpi_handle", file: !1, line: 16, baseType: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "acpi_device_info", file: !1, line: 12, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "valid", scope: !23, file: !1, line: 13, baseType: !10, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !23, file: !1, line: 14, baseType: !10, size: 32, offset: 32)
!27 = !{}
!28 = !DILocalVariable(name: "handle", arg: 1, scope: !15, file: !1, line: 17, type: !18)
!29 = !DILocation(line: 17, column: 47, scope: !15)
!30 = !DILocalVariable(name: "return_buffer", arg: 2, scope: !15, file: !1, line: 17, type: !21)
!31 = !DILocation(line: 17, column: 81, scope: !15)
!32 = !DILocation(line: 18, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !15, file: !1, line: 18, column: 6)
!34 = !DILocation(line: 18, column: 14, scope: !33)
!35 = !DILocation(line: 18, column: 18, scope: !33)
!36 = !DILocation(line: 18, column: 6, scope: !15)
!37 = !DILocation(line: 19, column: 3, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 18, column: 33)
!39 = !DILocalVariable(name: "info", scope: !15, file: !1, line: 21, type: !22)
!40 = !DILocation(line: 21, column: 27, scope: !15)
!41 = !DILocation(line: 21, column: 34, scope: !15)
!42 = !DILocalVariable(name: "valid", scope: !15, file: !1, line: 22, type: !10)
!43 = !DILocation(line: 22, column: 6, scope: !15)
!44 = !DILocation(line: 23, column: 16, scope: !15)
!45 = !DILocation(line: 23, column: 2, scope: !15)
!46 = !DILocation(line: 23, column: 8, scope: !15)
!47 = !DILocation(line: 23, column: 14, scope: !15)
!48 = !DILocation(line: 24, column: 19, scope: !15)
!49 = !DILocation(line: 24, column: 3, scope: !15)
!50 = !DILocation(line: 24, column: 17, scope: !15)
!51 = !DILocation(line: 25, column: 2, scope: !15)
!52 = !DILocation(line: 26, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "xgene_ahci_probe", scope: !1, file: !1, line: 27, type: !54, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !27)
!54 = !DISubroutineType(types: !55)
!55 = !{!10, !18}
!56 = !DILocalVariable(name: "handle", arg: 1, scope: !53, file: !1, line: 27, type: !18)
!57 = !DILocation(line: 27, column: 35, scope: !53)
!58 = !DILocalVariable(name: "version", scope: !53, file: !1, line: 28, type: !3)
!59 = !DILocation(line: 28, column: 26, scope: !53)
!60 = !DILocalVariable(name: "status", scope: !53, file: !1, line: 30, type: !9)
!61 = !DILocation(line: 30, column: 14, scope: !53)
!62 = !DILocalVariable(name: "info", scope: !53, file: !1, line: 31, type: !22)
!63 = !DILocation(line: 31, column: 27, scope: !53)
!64 = !DILocation(line: 33, column: 32, scope: !53)
!65 = !DILocation(line: 33, column: 11, scope: !53)
!66 = !DILocation(line: 33, column: 9, scope: !53)
!67 = !DILocation(line: 34, column: 6, scope: !68)
!68 = distinct !DILexicalBlock(scope: !53, file: !1, line: 34, column: 6)
!69 = !DILocation(line: 34, column: 6, scope: !53)
!70 = !DILocation(line: 35, column: 11, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !1, line: 34, column: 28)
!72 = !DILocation(line: 36, column: 2, scope: !71)
!73 = !DILocation(line: 37, column: 6, scope: !74)
!74 = distinct !DILexicalBlock(scope: !53, file: !1, line: 37, column: 6)
!75 = !DILocation(line: 37, column: 12, scope: !74)
!76 = !DILocation(line: 37, column: 18, scope: !74)
!77 = !DILocation(line: 37, column: 6, scope: !53)
!78 = !DILocation(line: 38, column: 14, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 37, column: 36)
!80 = !DILocation(line: 39, column: 2, scope: !79)
!81 = !DILocation(line: 40, column: 9, scope: !53)
!82 = !DILocation(line: 40, column: 2, scope: !53)
