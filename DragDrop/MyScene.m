//
//  MyScene.m
//  DragDrop
//
//  Created by Jesus Magana on 7/1/14.
//  Copyright (c) 2014 ZeroLinux5. All rights reserved.
//

#import "MyScene.h"

static NSString * const kAnimalNodeName = @"movable";

@interface MyScene ()

@property (nonatomic, strong) SKSpriteNode *background;
@property (nonatomic, strong) SKSpriteNode *selectedNode;

@end

@implementation MyScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 1) Loading the background
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"blue-shooting-stars"];
        [_background setName:@"background"];
        [_background setAnchorPoint:CGPointZero];
        [self addChild:_background];
        
        // 2) Loading the images
        NSArray *imageNames = @[@"bird", @"cat", @"dog", @"turtle"];
        for(int i = 0; i < [imageNames count]; ++i) {
            NSString *imageName = [imageNames objectAtIndex:i];
            SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:imageName];
            [sprite setName:kAnimalNodeName];
            
            float offsetFraction = ((float)(i + 1)) / ([imageNames count] + 1);
            [sprite setPosition:CGPointMake(size.width * offsetFraction, size.height / 2)];
            [_background addChild:sprite];
        }
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
