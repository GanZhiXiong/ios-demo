//
//  GanSubtitleTableViewCell.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/10/30.
//

#import "GanSubtitleTableViewCell.h"

@implementation GanSubtitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        // 可以在这里进行自定义样式的设置
        // 例如，修改字体、颜色等
//        self.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
//        self.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
        self.detailTextLabel.textColor = [UIColor grayColor];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
