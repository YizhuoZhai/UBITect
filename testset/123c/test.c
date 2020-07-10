#include <stdio.h>
int a = 0;
#define NULL 0
struct delayed_work {
	int cpu;
};
typedef struct {
	int counter;
} atomic_t;
typedef struct refcount_struct {
	atomic_t refs;
} refcount_t;
struct kref {
	refcount_t refcount;
};
struct kobject
{
	const char *name;
	struct kref kref;
	struct delayed_work	release;
	unsigned int state_initialized:1;
};
struct device{
	struct device    *parent;
	struct kobject kobj;
};
struct power_supply{
	void *drv_data;
	struct device dev;
};
struct power_supply init={NULL};
int refcount_dec_and_test(refcount_t *r)
{
	if(r->refs.counter)
	{
	
	}
	return 0;
}
static inline int kref_put(struct kref *kref)
{
	if(refcount_dec_and_test(&kref->refcount))
	{
	}
	return 0;
}
void kobject_put(struct kobject *kobj)
{
	if(kobj)
	{
		if(!kobj->state_initialized)
		{
		}
		kref_put(&kobj->kref);
	}
}
void put_device(struct device *dev)
{
	/* might_sleep(); */
	if (dev){
		kobject_put(&dev->kobj);
	}
}
void power_supply_put(struct power_supply *psy){
	put_device(&psy->dev);
}
int f(){
	struct power_supply *psy;
	if(a == 1){
		goto out;	
	}
	psy = &init;
out:
	power_supply_put(psy);
	return 0;
}
