//
//  BChatOptionsActionSheet.m
//  Pods
//
//  Created by Benjamin Smiley-andrews on 18/12/2016.
//
//

#import "BChatOptionsActionSheet.h"

#import <ChatSDK/Core.h>
#import <ChatSDK/UI.h>

@implementation BChatOptionsActionSheet

-(instancetype) initWithDelegate: (id<BChatOptionDelegate>) delegate {
    if((self = [self init])) {
        self.delegate = delegate;
        
        _options = BChatSDK.ui.chatOptions;
        
        for(BChatOption * o in _options) {
            o.parent = self;
        }
        
    }
    return self;
}

-(BOOL) show: (UIView *)popoverSourceView {
    [self.delegate hideKeyboard];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle: [NSBundle t: bOptions] message: nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    if (popoverSourceView != nil) {
        alert.popoverPresentationController.sourceView = popoverSourceView;
        alert.popoverPresentationController.sourceRect = popoverSourceView.frame;
    }
    
    for (BChatOption * option in _options) {
        UIAlertAction * action = [UIAlertAction actionWithTitle: option.title style: UIAlertActionStyleDefault handler: ^(UIAlertAction * _Nonnull action) {
            [option execute];
        }];
        [alert addAction: action];
    }
    [alert addAction: [UIAlertAction actionWithTitle: [NSBundle t:bOk] style: UIAlertActionStyleCancel handler: ^(UIAlertAction * _Nonnull action) {
        
    }]];
    [[self.delegate currentViewController] presentViewController: alert animated: YES completion: nil];
    return NO;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex) {
        BChatOption * option = _options[buttonIndex - 1];
        [_delegate chatOptionActionExecuted:[option execute]];
    }
}

-(UIView *) keyboardView {
    return Nil;
}

-(BOOL) hide {
    return NO;
}

-(void) presentView: (UIView *) view {
    
}

-(void) dismissView {
    
}


@end
