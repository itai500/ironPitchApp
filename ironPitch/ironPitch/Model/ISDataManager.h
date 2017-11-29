//
//  ISDataManager.h
//  ironPitch
//
//  Created by Itai Asaf on 29/11/2017.
//  Copyright © 2017 Itai Asaf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISDataManager : NSObject

- (void)fetchDataFromRemoteServer;
- (NSDictionary*)getAppData;

@end
