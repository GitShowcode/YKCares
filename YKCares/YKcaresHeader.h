//
//  YKcaresHeader.h
//  YKCares
//
//  Created by jiapeixin on 16/4/6.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#ifndef YKcaresHeader_h
#define YKcaresHeader_h

#define Baseurl @"http://www.ykcares.com/"

#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)



#endif /* YKcaresHeader_h */
