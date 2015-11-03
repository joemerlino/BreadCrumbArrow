/* Generated by RuntimeBrowser
   Image: /System/Library/PrivateFrameworks/ChatKit.framework/ChatKit
 */

@interface CKMessageEntryAudioHintView : UIView {
    struct UIEdgeInsets { 
        float top; 
        float left; 
        float bottom; 
        float right; 
    } _coverInsets;
    UIButton *_hintButton;
    UIImageView *_hintImageView;
    UILabel *_hintLabel;
    UIButton *_referenceButton;
}

@property (nonatomic) struct UIEdgeInsets { float x1; float x2; float x3; float x4; } coverInsets;
@property (nonatomic, retain) UIButton *hintButton;
@property (nonatomic, retain) UIImageView *hintImageView;
@property (nonatomic, retain) UILabel *hintLabel;
@property (nonatomic, retain) UIButton *referenceButton;

- (struct UIEdgeInsets { float x1; float x2; float x3; float x4; })coverInsets;
- (void)dealloc;
- (id)hintButton;
- (id)hintImageView;
- (id)hintLabel;
- (id)initWithReferenceButton:(id)arg1 coverInsets:(struct UIEdgeInsets { float x1; float x2; float x3; float x4; })arg2;
- (void)layoutSubviews;
- (id)referenceButton;
- (void)setCoverInsets:(struct UIEdgeInsets { float x1; float x2; float x3; float x4; })arg1;
- (void)setHidden:(BOOL)arg1 animated:(BOOL)arg2 completion:(id /* block */)arg3;
- (void)setHintButton:(id)arg1;
- (void)setHintImageView:(id)arg1;
- (void)setHintLabel:(id)arg1;
- (void)setReferenceButton:(id)arg1;

@end
