//
//  BChatOptionsDelegate.h
//  Pods
//
//  Created by Benjamin Smiley-andrews on 17/12/2016.
//
//

#ifndef BChatOptionDelegate_h
#define BChatOptionDelegate_h

@class RXPromise;

@protocol PThread;

@protocol BChatOptionDelegate <NSObject>

-(UIViewController *) currentViewController;
-(void) chatOptionActionExecuted: (RXPromise *) promise;
-(void) reloadData;

-(RXPromise *) sendTextMessage: (NSString *) text;
-(RXPromise *) sendImageMessage: (UIImage *) image;
-(RXPromise *) sendVideoMessage: (NSData *) video withCoverImage: (UIImage *) coverImage;
-(RXPromise *) sendStickerMessage: (NSString *) name;
-(RXPromise *) sendFileMessage: (NSDictionary *) file;
-(void) hideKeyboard;
@optional
-(UIView *) view;

@end

#endif /* BChatOptionsDelegate_h */
