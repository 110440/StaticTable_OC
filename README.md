# StaticTable_OC

一个 tableView 的封装，简化类似 设置，表单 这类的界面开发,包括常用的cell，键盘躲避，可以很方便自定义和扩展

<img src="https://github.com/110440/StaticTable_OC/raw/master/Simulator%20Screen%20Shot.png" width="375" height="667">

# 使用

> 子类继承于 StaticTableController 并重载 -(void)buildCells:(StaticTableViewBuilder *)builder 方法
>
-(void)buildCells:(StaticTableViewBuilder *)builder{  
    builder.isAndroidStyle = YES;  
    [builder appendSection:[[StaticTableViewSection alloc] initWithTitle:@"test" height:40]];  
    [builder appendCell:self.cell];  
}  
-(StaticBaseCell *)cell{  
  if(!_cell){  
    _cell = [[StaticBaseCell alloc] init];  
    _cell.selectAction = ^{  
        };  
    }  
    return _cell;  
}   
