#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int a = 1;
struct ttm_buffer_object {
	size_t acc_size;
	bool evicted;
};
struct vmw_dma_buffer {
	struct ttm_buffer_object base;
};
struct ttm_buffer_object *tbobj;
struct vmw_dma_buffer *vdbuffer;
int doinit(struct vmw_dma_buffer **vmw_bo_p){
	if(a ==1){
		(*vmw_bo_p)->base = *tbobj; 
	}
	else{
		return 0;	
	}
	
	return 1;
}
int vmw_query_bo_switch_prepare(struct ttm_buffer_object *new_query_bo){
	if (new_query_bo != tbobj){
		return -1;
	}
	else{
		return 0;	
	}
}
int vmw_translate_mob_ptr(struct vmw_dma_buffer **vmw_bo_p){
	struct vmw_dma_buffer *vmw_bo = NULL;
	int ret = doinit(&vmw_bo);
	if(ret != 0){
		return 0; 	
	}
	else if(a == 1){
		goto  out_no_reloc;       
	}
	*vmw_bo_p = vmw_bo;
	return ret;
out_no_reloc:
	vmw_bo_p = NULL;
	return ret;
}
int vmw_cmd_end_gb_query(){
	struct vmw_dma_buffer *vmw_bo;
	int ret = vmw_translate_mob_ptr(&vmw_bo);
	if(ret != 0){
		return ret;	
	}
	vmw_query_bo_switch_prepare(&vmw_bo->base);
	return 0;	
}

