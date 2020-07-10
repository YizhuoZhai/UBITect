#define NFCTH_TUPLE_MAX 8
#define	EINVAL		22
#define NFCTH_TUPLE_L3PROTONUM 1
#define NFCTH_TUPLE_L4PROTONUM 2
#define NFCTH_TUPLE 2
#define NULL ((void *)0)
#include <stdlib.h>
#include <string.h>
union nf_conntrack_man_proto 
{
	unsigned int all;
};
struct nf_conntrack_man {
	int l3num;
	union nf_conntrack_man_proto u;
};
struct nlattr {
	short           nla_len;
	short           nla_type;
};
struct list_head {
    struct list_head *next, *prev;
};
struct nf_conntrack_tuple {
	struct nf_conntrack_man src;

	/* These are the parts of the tuple which are fixed. */
	struct {
		/* The protocol. */
		int protonum;
		/* The direction (for tuplehash) */
		 int dir;
	} dst;
};
struct nf_conntrack_helper {
	struct nf_conntrack_tuple tuple;
	unsigned int flags;
};
unsigned int helper_hash(const struct nf_conntrack_tuple *tuple)
{
	return (((tuple->src.l3num << 8) | tuple->dst.protonum) ^
		(unsigned int)tuple->src.u.all);
}
struct nfnl_cthelper {
	struct list_head		list;
	struct nf_conntrack_helper	helper;
};
int nf_conntrack_helper_register(struct nf_conntrack_helper *me){
	unsigned int h = helper_hash(&me->tuple);
	return 1;
}
int nfnl_cthelper_create(const struct nlattr * const tb[],
		     struct nf_conntrack_tuple *tuple)
{
	struct nf_conntrack_helper *helper;
	struct nfnl_cthelper *nfcth;
	if (!tb[NFCTH_TUPLE])
		return -EINVAL;
	
	nfcth = malloc(sizeof(*nfcth));
	helper = &nfcth->helper;
	memcpy(&helper->tuple, tuple, sizeof(struct nf_conntrack_tuple));
	int ret = nf_conntrack_helper_register(helper);
	
	return ret;
}

int nfnl_cthelper_parse_tuple(struct nf_conntrack_tuple *tuple,  const struct nlattr *attr)
{
 	tuple->src.l3num = sizeof(struct nlattr);
 	tuple->dst.protonum = sizeof(struct nlattr);
 
 	return 0;
}
int nfnl_cthelper_new(const struct nlattr * const tb[])
{
	struct nf_conntrack_tuple tuple;
	struct nf_contrack_helper *helper = NULL;
	int ret = 0, i;

	ret = nfnl_cthelper_parse_tuple(&tuple, tb[NFCTH_TUPLE]);

	if(helper == NULL)
	{
		ret = nfnl_cthelper_create(tb, &tuple);	
	}	

	return ret;
}

