//
//  DetailViewController.h
//  Beispiel
//
//  Created by Schuldes Christian on 21.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController {
    NSMutableArray *_dataArray;
}

-(id) initWithDictionary:(NSMutableArray*)theDictionary;

@end
