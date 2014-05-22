//
//  MyScene.m
//  4physicsBodys_Linked_By_RopeJoint
//
//  Created by YG on 2/17/14.
//  Copyright (c) 2014 YuryGitman. All rights reserved.
//


#import "MyScene.h"

@interface MyScene()
//main body
@property SKSpriteNode* mySquare1;
@property SKSpriteNode* mySquare2;
@property SKSpriteNode* mySquare3;
@property SKSpriteNode* mySquare4;

//ears
@property SKSpriteNode* mySquare5;
@property SKSpriteNode* mySquare6;

//arms
@property(nonatomic) CGFloat damping;
@property SKSpriteNode* mySquare7;
@property SKSpriteNode* mySquare8;
@property SKSpriteNode* mySquare9;
@property SKSpriteNode* mySquare10;


//tail
@property SKSpriteNode* mySquare11;


@property SKSpriteNode* myShelf;

//joints connecting
@property SKPhysicsJoint* myRopeJoint; //connects sq 1 and 2
@property SKPhysicsJoint* myRopeJoint1; //connects sq 2 and 3
@property SKPhysicsJoint* myRopeJoint2; //connects sq 3 and 4

//ears connected to head
@property SKPhysicsJoint* myRopeJoint3; //connects sq 1 and 5
@property SKPhysicsJoint* myRopeJoint4; //connects sq 1 and 6

//arms connected to body
@property SKPhysicsJoint* myRopeJoint5; //connects sq 2 and 7
@property SKPhysicsJoint* myRopeJoint6; //connects sq 2 and 8
@property SKPhysicsJoint* myRopeJoint7; //connects sq 4 and 9
@property SKPhysicsJoint* myRopeJoint8; //connects sq 4 and 10


//tail connected to last square
@property SKPhysicsJoint* myRopeJoint9; //connects sq 4 and 11




@end

@implementation MyScene

-(void) activateJointRope{
    
    _myRopeJoint = [SKPhysicsJointLimit jointWithBodyA:_mySquare1.physicsBody bodyB:_mySquare2.physicsBody anchorA:_mySquare1.position anchorB:_mySquare2.position];
    
    [self.physicsWorld addJoint:_myRopeJoint];
    
    _myRopeJoint1 = [SKPhysicsJointLimit jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare3.physicsBody anchorA:_mySquare2.position anchorB:_mySquare3.position];
    
    [self.physicsWorld addJoint:_myRopeJoint1];
    
    
    _myRopeJoint2 = [SKPhysicsJointLimit jointWithBodyA:_mySquare3.physicsBody bodyB:_mySquare4.physicsBody anchorA:_mySquare3.position anchorB:_mySquare4.position];
    
    [self.physicsWorld addJoint:_myRopeJoint2];
    
    //ears
    //left
    _myRopeJoint3 = [SKPhysicsJointPin jointWithBodyA:_mySquare1.physicsBody bodyB:_mySquare5.physicsBody anchor:_mySquare1.position];
    
    [self.physicsWorld addJoint:_myRopeJoint3];
    
    //right
    _myRopeJoint4 = [SKPhysicsJointPin jointWithBodyA:_mySquare1.physicsBody bodyB:_mySquare6.physicsBody anchor:_mySquare1.position];
    
    [self.physicsWorld addJoint:_myRopeJoint4];
    
    
    //arms
    //high left
    
    //_myRopeJoint5 = [SKPhysicsJointLimit jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare7.physicsBody anchorA:_mySquare2.position anchorB:_mySquare7.position];
    //_myRopeJoint5 = [SKPhysicsJointFixed jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare7.physicsBody anchor:_mySquare2.position];
    //_myRopeJoint5 = [SKPhysicsJointSliding jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare7.physicsBody anchor:_mySquare2.physicsBody axis:<#(CGVector)#>]
    
    _myRopeJoint5 = [SKPhysicsJointSpring jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare7.physicsBody anchorA:_mySquare2.position anchorB:_mySquare7.position];
    
    [self.physicsWorld addJoint:_myRopeJoint5];
    
    //high right
    _myRopeJoint6 = [SKPhysicsJointSpring jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare8.physicsBody anchorA:_mySquare2.position anchorB:_mySquare8.position];
    
    [self.physicsWorld addJoint:_myRopeJoint6];
    
    //low left
    _myRopeJoint7 = [SKPhysicsJointSpring jointWithBodyA:_mySquare4.physicsBody bodyB:_mySquare9.physicsBody anchorA:_mySquare4.position anchorB:_mySquare9.position];
    
    [self.physicsWorld addJoint:_myRopeJoint7];
    
    //low right
    _myRopeJoint8 = [SKPhysicsJointSpring jointWithBodyA:_mySquare4.physicsBody bodyB:_mySquare10.physicsBody anchorA:_mySquare4.position anchorB:_mySquare10.position];
    
    [self.physicsWorld addJoint:_myRopeJoint8];
    
    //tail
    
    _myRopeJoint9 = [SKPhysicsJointFixed jointWithBodyA:_mySquare4.physicsBody bodyB:_mySquare11.physicsBody anchor:_mySquare4.position];
    
    [self.physicsWorld addJoint:_myRopeJoint9];
    
}

-(void) spawnSquares{
    //body
    _mySquare1 = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    _mySquare2 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(70, 70)];
    _mySquare3 =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(70, 70)];
    _mySquare4 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(70, 70)];
    
    //ears
    _mySquare5 =[[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(10, 10)];
    _mySquare6 =[[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(10, 10)];
    
    //arms
    _mySquare7 =[[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(40, 40)];

    _mySquare8 =[[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(40, 40)];

    _mySquare9 =[[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(40, 40)];

    _mySquare10 =[[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(40, 40)];
    
    //tail
    _mySquare11 =[[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];

    
    //body
    [_mySquare1 setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.5)];
    [_mySquare2 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2)];
    [_mySquare3 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2.5)];
    [_mySquare4 setPosition:CGPointMake(self.size.width/1.5, self.size.height/3)];
    
    //ears
    [_mySquare5 setPosition:CGPointMake(self.size.width/1.2, self.size.height/1.5)];
    [_mySquare6 setPosition:CGPointMake(self.size.width/1.7, self.size.height/1.5)];
    
    //arms
    [_mySquare7 setPosition:CGPointMake(self.size.width/1.2, self.size.height/2)];
    [_mySquare8 setPosition:CGPointMake(self.size.width/1.7, self.size.height/2)];
    [_mySquare9 setPosition:CGPointMake(self.size.width/1.2, self.size.height/3)];
    [_mySquare10 setPosition:CGPointMake(self.size.width/1.7, self.size.height/3)];
    
    //tail
    [_mySquare11 setPosition:CGPointMake(self.size.width/1.5, self.size.height/4)];
    
    
    //body
    _mySquare1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare1.size];
    _mySquare2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare2.size];
    _mySquare3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare3.size];
    _mySquare4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare4.size];
    
    //ears
     _mySquare5.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare5.size];
     _mySquare6.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare6.size];
    
    //arms
    
     _mySquare7.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare7.size];
     _mySquare8.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare8.size];
     _mySquare9.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare9.size];
     _mySquare10.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare10.size];
    
    //tail
    _mySquare11.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare11.size];
    
    //body
    [_mySquare1.physicsBody setRestitution:1.0];
    [_mySquare2.physicsBody setRestitution:1.0];
    [_mySquare3.physicsBody setRestitution:1.0];
    [_mySquare4.physicsBody setRestitution:1.0];
    
    //ears
    [_mySquare5.physicsBody setRestitution:1.0];
    [_mySquare6.physicsBody setRestitution:1.0];
    
    //arms
    [_mySquare7.physicsBody setRestitution:1.0];
    [_mySquare8.physicsBody setRestitution:1.0];
    [_mySquare9.physicsBody setRestitution:1.0];
    [_mySquare10.physicsBody setRestitution:1.0];
    
    //tail
     [_mySquare11.physicsBody setRestitution:1.0];
    
    //body
    [self addChild:_mySquare1];
    [self addChild:_mySquare2];
    [self addChild:_mySquare3];
    [self addChild:_mySquare4];
    
    //ears
    [self addChild:_mySquare5];
    [self addChild:_mySquare6];
    
    //arms
    [self addChild:_mySquare7];
    [self addChild:_mySquare8];
    [self addChild:_mySquare9];
    [self addChild:_mySquare10];
    
    //tail
    [self addChild:_mySquare11];
    
}

-(void)makeShelf{
    _myShelf = [[SKSpriteNode alloc]initWithColor:[SKColor lightGrayColor] size:CGSizeMake(100, 40)];
    _myShelf.position = CGPointMake(self.size.width/2.4, self.size.height/2);
    _myShelf.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myShelf.size];
    [_myShelf.physicsBody setDynamic:NO];
    
    [self addChild:_myShelf];
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.scaleMode = SKSceneScaleModeAspectFit;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self.physicsBody setRestitution:1];
        
        
        [self spawnSquares];
        
        [self activateJointRope];
        [self makeShelf];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (_mySquare1.physicsBody.dynamic) {
        
        [_mySquare1.physicsBody setDynamic:NO];
    }
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_mySquare1 setPosition:location];
        
        
        // [_mySquare1.physicsBody setDynamic:NO];
        //  [_mySquare2.physicsBody setDynamic:NO];
        
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_mySquare1 setPosition:location];
        
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_mySquare1.physicsBody.dynamic) {
        [_mySquare1.physicsBody setDynamic:YES];
    }
    //  [_mySquare1.physicsBody setDynamic:YES];
    //  [_mySquare2.physicsBody setDynamic:YES];
    
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!_mySquare1.physicsBody.dynamic) {
        [_mySquare1.physicsBody setDynamic:YES];
    }
    //  [_mySquare1.physicsBody setDynamic:YES];
    //  [_mySquare2.physicsBody setDynamic:YES];
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end









//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    
//    //    if (_torso.physicsBody.dynamic) {
//    //
//    //        [_torso.physicsBody setDynamic:NO];
//    //
//    //        //        [_head.physicsBody setDynamic:NO];
//    //        //
//    //        //        [_armL.physicsBody setDynamic:NO];
//    //        //        [_armR.physicsBody setDynamic:NO];
//    //        //
//    //        //        [_handL.physicsBody setDynamic:NO];
//    //        //        [_handR.physicsBody setDynamic:NO];
//    //        //
//    //        //        [_legL.physicsBody setDynamic:NO];
//    //        //        [_legR.physicsBody setDynamic:NO];
//    //        //        [_footL.physicsBody setDynamic:NO];
//    //        //        [_footR.physicsBody setDynamic:NO];
//    //    }
//    
//    //UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInNode:self];
//    CGPoint location2 = [touch locationInNode:self];
//    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
//    for (UITouch *touch in touches) {
//        for (SKNode *node in nodes) {
//            //go through nodes, get the zPosition if you want
//            //int nodePos = node.zPosition;
//            
//            
//            
//            
//            
//            //or check the node against your nodes
//            if ([node.name isEqualToString:@"torso"]) {
//                [_torso setPosition:location];
//            }
//            if ([node.name isEqualToString:@"square1"]) {
//                [_square1.physicsBody setDynamic:NO];
//                [_square1 setPosition:location];
//            }
//            if ([node.name isEqualToString:@"square2"]) {
//                [_square2.physicsBody setDynamic:NO];
//                [_square2 setPosition:location2];
//            }
//            
//            
//        }
//        
//        //        if (CGRectIntersectsRect(location.x, _torso.frame)) {
//        //            [_torso setPosition:location];
//        //        }
//        //[_torso setPosition:location];
//    }
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInNode:self];
//    CGPoint location2 = [touch locationInNode:self];
//    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
//    for (SKNode *node in nodes) {
//        //go through nodes, get the zPosition if you want
//        //int nodePos = node.zPosition;
//        
//        //or check the node against your nodes
//        if ([node.name isEqualToString:@"torso"]) {
//            [_torso setPosition:location];
//        }
//        if ([node.name isEqualToString:@"square1"]) {
//            [_square1 setPosition:location];
//        }
//        if ([node.name isEqualToString:@"square2"]) {
//            [_square2 setPosition:location2];
//        }
//    }
//}
//
//-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
//    
//    if (!_torso.physicsBody.dynamic) {
//        [_torso.physicsBody setDynamic:YES];
//    }
//    
//    if (!_square1.physicsBody.dynamic) {
//        [_square1.physicsBody setDynamic:YES];
//    }
//    if (!_square2.physicsBody.dynamic) {
//        [_square2.physicsBody setDynamic:YES];
//    }
//    //  [_mySquare1.physicsBody setDynamic:YES];
//    //  [_mySquare2.physicsBody setDynamic:YES];
//    
//}
//
//-(void)update:(CFTimeInterval)currentTime {
//    /* Called before each frame is rendered */
//}
