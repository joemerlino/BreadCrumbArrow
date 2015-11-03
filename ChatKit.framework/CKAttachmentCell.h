/* Generated by RuntimeBrowser
   Image: /System/Library/PrivateFrameworks/ChatKit.framework/ChatKit
 */

@interface CKAttachmentCell : UICollectionViewCell <CKAnimationTimerObserver, UIGestureRecognizerDelegate> {
    CKAnimatedImage *_animatedImage;
    UIImageView *_checkmarkView;
    NSObject<CKAttachmentCellDelegate> *_delegate;
    BOOL _editing;
    NSArray *_frames;
    UIImage *_image;
    UIImageView *_irisBadgeView;
    BOOL _isIrisAsset;
    CKAttachmentItem *_representedObject;
    UITapGestureRecognizer *_tapRecognizer;
}

@property (nonatomic, retain) CKAnimatedImage *animatedImage;
@property (nonatomic, retain) UIImageView *checkmarkView;
@property (readonly, copy) NSString *debugDescription;
@property (nonatomic) NSObject<CKAttachmentCellDelegate> *delegate;
@property (readonly, copy) NSString *description;
@property (getter=isEditing, nonatomic) BOOL editing;
@property (nonatomic, copy) NSArray *frames;
@property (readonly) unsigned int hash;
@property (nonatomic, retain) UIImage *iconImage;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImageView *irisBadgeView;
@property (nonatomic) BOOL isIrisAsset;
@property (nonatomic, retain) CKAttachmentItem *representedObject;
@property (readonly) Class superclass;
@property (nonatomic, retain) UITapGestureRecognizer *tapRecognizer;

- (struct CGImage { }*)_cgImageForUIImage:(id)arg1;
- (id)animatedImage;
- (void)animationTimerFired:(unsigned int)arg1;
- (id)checkmarkView;
- (void)copy:(id)arg1;
- (void)dealloc;
- (id)delegate;
- (void)delete:(id)arg1;
- (id)frames;
- (BOOL)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2;
- (id)iconImage;
- (id)image;
- (id)initWithFrame:(struct CGRect { struct CGPoint { float x_1_1_1; float x_1_1_2; } x1; struct CGSize { float x_2_1_1; float x_2_1_2; } x2; })arg1;
- (id)irisBadgeView;
- (BOOL)isEditing;
- (BOOL)isIrisAsset;
- (void)layoutSubviews;
- (void)more:(id)arg1;
- (void)prepareForReuse;
- (id)representedObject;
- (void)saveAttachment:(id)arg1;
- (void)setAnimatedImage:(id)arg1;
- (void)setCheckmarkView:(id)arg1;
- (void)setDelegate:(id)arg1;
- (void)setEditing:(BOOL)arg1;
- (void)setFrames:(id)arg1;
- (void)setIconImage:(id)arg1;
- (void)setImage:(id)arg1;
- (void)setIrisBadgeView:(id)arg1;
- (void)setIsIrisAsset:(BOOL)arg1;
- (void)setRepresentedObject:(id)arg1;
- (void)setSelected:(BOOL)arg1;
- (void)setTapRecognizer:(id)arg1;
- (void)tapGestureRecognized:(id)arg1;
- (id)tapRecognizer;
- (void)updateAnimationTimerObserving;

@end
