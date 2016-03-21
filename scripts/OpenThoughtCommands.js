commandArray = [
	['WebBaseMain.ot', 'run_mode=customerSearch', 'command=searchMyCustomers'],
	['WebBaseMain.ot', 'run_mode=customer', 'command=openCustomer','customerId=28299','customerAccountNumber=3212545559A'],
	['WebBaseMain.ot', 'run_mode=customer', 'command=closeCustomer'],
	['WebBaseMain.ot', 'run_mode=customerSearch', 'command=searchMyCustomers'],
	['WebBaseMain.ot', 'run_mode=adOrderSearch', 'command=searchCustomerOrders','customerId=28299','customerAccountNumber=3212545559A'],
	['WebBaseMain.ot', 'run_mode=adorder', 'command=openOrder','orderId=1520'],
	['WebBaseMain.ot', 'run_mode=adorder', 'command=closeOrder'],
	['LOOP']
	];
commandArrayIndex = 0;
commandTimer = (100);