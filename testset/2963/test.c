//#include <stdio.h>
//#include <stdlib.h> 

//#define __u32 unsigned int;
//#define __u16 unsinged short;
//#define __u8 unsigned char;i
#define __user
typedef unsigned int u32; 
int cmd = 1;
struct video_tuner
{
	int tuner;
	char name[32];
	unsigned long rangelow, rangehigh;	
	unsigned int flags;
	unsigned short mode;			
	unsigned short signal;			
};
struct video_code
{
	char	loadwhat[16];	
	int	datasize;
	unsigned char	*data;
};
struct video_code32 {
	char		loadwhat[16];	/* name or tag of file being passed */
	int	datasize;
	u32	data;
};
unsigned long copy_from_user (void * to, const void __user *  	from, unsigned long n)
{
	return 0;
}
static inline void __user *compat_ptr(u32 uptr)
{
	return (void __user *)(unsigned long)uptr;
}
void get_microcode32(struct video_code *kp,struct video_code32 __user *up)
{
	copy_from_user(kp->data, up->data, up->datasize);  	
}
void caller(unsigned long arg){
	union{
		struct video_tuner vt;
		struct video_code vc;
	}karg;
	void __user *up = compat_ptr(arg);
	switch(cmd){
		case 1:
			get_microcode32(&karg.vc, up);
	}
}

