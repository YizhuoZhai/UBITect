#include <stdio.h>
#define	ENETUNREACH	51
#define	EAGAIN		35
int a = 0;
struct fib_info{
	int fib_treeref;
};
struct fib_table
{
	int	tb_id;
	unsigned long	*tb_data;
};
struct fib_result {
	unsigned char	prefixlen;
	unsigned char	nh_sel;
	unsigned char	type;
	unsigned char	scope;
	int		tclassid;
	struct fib_info *fi;
	struct fib_table *table;
};
struct fib_result fs = {'a'};
int fib_table_lookup(struct fib_result *res)
{
	if(a)
	{
		res = &fs;
	}
	return 0;
}
int fib_lookup(struct fib_result *res)
{
	int err = -ENETUNREACH;

	if (a)
		err = fib_table_lookup(res);

	if (err == -EAGAIN)
		err = -ENETUNREACH;

	return err;
}
int ip_route_input_slow()
{
	struct fib_result res;
	int err;
	res.fi = NULL;
	err = fib_table_lookup(&res);	
	if(res.table)
	{
	    a = 1;
	}
	return a;
}
