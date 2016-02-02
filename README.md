# JFTransfromCard
使用方法与正常的UITableView相似，初始化一个JFTransfromCard，添加到界面即可，然后需要实现JFTransfromCard的几个代理方法：

-(NSInteger)numberOfCard
返回页面显示多少个卡片

-(id)dataSourceForCard:(id)dataSource AtIndex:(NSInteger)index
卡片的数据源

-(void)transformCardSelectedAtIndex:(NSInteger)index
卡片的点击事件

-(void)transformCardStableAtIndex:(NSInteger)index
卡片稳定停留被拉伸到最大那张卡片的下标
