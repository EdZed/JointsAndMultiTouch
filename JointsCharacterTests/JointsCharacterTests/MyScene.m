//
//  MyScene.m
//  JointsCharacterTests
//
//  Created by Omega on 5/22/14.
//  Copyright (c) 2014 Omega. All rights reserved.
//

#import "MyScene.h"

@interface MyScene()

@property SKSpriteNode* head;
@property SKSpriteNode* torso;

@property SKSpriteNode* armL;
@property SKSpriteNode* armR;
@property SKSpriteNode* handL;
@property SKSpriteNode* handR;

@property SKSpriteNode* legL;
@property SKSpriteNode* legR;
@property SKSpriteNode* footL;
@property SKSpriteNode* footR;


@property SKSpriteNode* square1;
@property SKSpriteNode* square2;

@property(nonatomic) CGFloat damping;
//@property SKSpriteNode* myShelf;

//joints connecting
@property SKPhysicsJoint* headTorsoJoint;

@property SKPhysicsJoint* armLTorsoJoint;
@property SKPhysicsJoint* armRTorsoJoint;

@property SKPhysicsJoint* armLHandLJoint;
@property SKPhysicsJoint* armRHandRJoint;

@property SKPhysicsJoint* legLTorsoJoint;
@property SKPhysicsJoint* legRTorsoJoint;

@property SKPhysicsJoint* legLFootLJoint;
@property SKPhysicsJoint* legRFootRJoint;

@end

@implementation MyScene


-(void) activateJointRope{
    
    //head and torso
    _headTorsoJoint = [SKPhysicsJointLimit jointWithBodyA:_head.physicsBody bodyB:_torso.physicsBody anchorA:_head.position anchorB:_torso.position];
    
    [self.physicsWorld addJoint:_headTorsoJoint];
    //end
    
    //Left and right arms with torso
    _armLTorsoJoint = [SKPhysicsJointLimit jointWithBodyA:_torso.physicsBody bodyB:_armL.physicsBody anchorA:_torso.position anchorB:_armL.position];
    
    [self.physicsWorld addJoint:_armLTorsoJoint];
    
    
    _armRTorsoJoint = [SKPhysicsJointLimit jointWithBodyA:_torso.physicsBody bodyB:_armR.physicsBody anchorA:_torso.position anchorB:_armR.position];
    
    [self.physicsWorld addJoint:_armRTorsoJoint];
    //end
    
    
    //Left and right hands with respective arms
    _armLHandLJoint = [SKPhysicsJointPin jointWithBodyA:_armL.physicsBody bodyB:_handL.physicsBody anchor:_armL.position];
    
    [self.physicsWorld addJoint:_armLHandLJoint];
    
    _armRHandRJoint = [SKPhysicsJointPin jointWithBodyA:_armR.physicsBody bodyB:_handR.physicsBody anchor:_armR.position];
    
    [self.physicsWorld addJoint:_armRHandRJoint];
    //end
    
    
        //_myRopeJoint5 = [SKPhysicsJointSliding jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare7.physicsBody anchor:_mySquare2.physicsBody axis:<#(CGVector)#>]
    
    //left and right legs with torso
    _legLTorsoJoint = [SKPhysicsJointSpring jointWithBodyA:_legL.physicsBody bodyB:_torso.physicsBody anchorA:_legL.position anchorB:_torso.position];
    
    [self.physicsWorld addJoint:_legLTorsoJoint];
    
    _legRTorsoJoint = [SKPhysicsJointSpring jointWithBodyA:_legR.physicsBody bodyB:_torso.physicsBody anchorA:_legR.position anchorB:_torso.position];
    
    [self.physicsWorld addJoint:_legRTorsoJoint];
    
    //left and right feet with respective legs
    _legLFootLJoint = [SKPhysicsJointSpring jointWithBodyA:_legL.physicsBody bodyB:_footL.physicsBody anchorA:_legL.position anchorB:_footL.position];
    
    [self.physicsWorld addJoint:_legLFootLJoint];
    
    _legRFootRJoint = [SKPhysicsJointSpring jointWithBodyA:_legR.physicsBody bodyB:_footR.physicsBody anchorA:_legR.position anchorB:_footR.position];
    
    [self.physicsWorld addJoint:_legRFootRJoint];
    
}

-(void) spawnCharacterLimbs{
    //make sprite size and color
    _head = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    _torso =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(100, 100)];
    _armL =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(110, 30)];
    _armR =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(110, 30)];
    
    _handL =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(30, 30)];
    _handR =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(30, 30)];
    
    _legL =[[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(30, 110)];
    _legR =[[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(30, 110)];
    
    _footL =[[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(40, 40)];
    _footR =[[SKSpriteNode alloc]initWithColor:[SKColor greenColor] size:CGSizeMake(40, 40)];
    
    //set sprite positions
    [_head setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.5)];
    [_torso setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.8)];
    
    [_armL setPosition:CGPointMake(self.size.width/1.7, self.size.height/1.8)];
    [_armR setPosition:CGPointMake(self.size.width/1.3, self.size.height/1.8)];
    
    [_handL setPosition:CGPointMake(self.size.width/1.9, self.size.height/1.8)];
    [_handR setPosition:CGPointMake(self.size.width/1.2, self.size.height/1.8)];
    
    
    [_legL setPosition:CGPointMake(self.size.width/1.55, self.size.height/2.4)];
    [_legR setPosition:CGPointMake(self.size.width/1.45, self.size.height/2.4)];
    [_footL setPosition:CGPointMake(self.size.width/1.55, self.size.height/3)];
    [_footR setPosition:CGPointMake(self.size.width/1.45, self.size.height/3)];
    
    //sprite names
    _torso.name = @"torso";
    
    
    //make physics bodies for sprites
    _head.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_head.size];
    _torso.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_torso.size];
    _armL.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_armL.size];
    _armR.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_armR.size];
    
    _handL.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_handL.size];
    _handR.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_handR.size];
    
    _legL.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_legL.size];
    _legR.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_legR.size];
    _footL.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_footL.size];
    _footR.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_footR.size];
    
    //set physics body restitution
    [_head.physicsBody setRestitution:1.0];
    [_torso.physicsBody setRestitution:1.0];
    [_armL.physicsBody setRestitution:1.0];
    [_armR.physicsBody setRestitution:1.0];
    
    [_handL.physicsBody setRestitution:1.0];
    [_handR.physicsBody setRestitution:1.0];
    
    [_legL.physicsBody setRestitution:1.0];
    [_legR.physicsBody setRestitution:1.0];
    [_footL.physicsBody setRestitution:1.0];
    [_footR.physicsBody setRestitution:1.0];
    
    //set dynamic
    [_head.physicsBody setDynamic:YES];
    [_torso.physicsBody setDynamic:YES];
    [_armL.physicsBody setDynamic:YES];
    [_armR.physicsBody setDynamic:YES];
    
    [_handL.physicsBody setDynamic:YES];
    [_handR.physicsBody setDynamic:YES];
    
    [_legL.physicsBody setDynamic:YES];
    [_legR.physicsBody setDynamic:YES];
    [_footL.physicsBody setDynamic:YES];
    [_footR.physicsBody setDynamic:YES];
    
    
    //add child for each sprite
    [self addChild:_head];
    [self addChild:_torso];
    [self addChild:_armL];
    [self addChild:_armR];
    
    [self addChild:_handL];
    [self addChild:_handR];
    
    [self addChild:_legL];
    [self addChild:_legR];
    [self addChild:_footL];
    [self addChild:_footR];
}

-(void) spawnTestSquares{
    //make sprite size and color
    _square1 = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    _square2 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(100, 100)];
    
    //set sprite positions
    [_square1 setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.5)];
    [_square2 setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.8)];
    
    //sprite names
    _square1.name = @"square1";
    _square2.name = @"square2";
    
    
    //make physics bodies for sprites
    _square1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_square1.size];
    _square2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_square2.size];
    
    //set physics body restitution
    [_square1.physicsBody setRestitution:1.0];
    [_square2.physicsBody setRestitution:1.0];
    
    //set dynamic
    [_square1.physicsBody setDynamic:YES];
    [_square2.physicsBody setDynamic:YES];
    
    //add child for each sprite
    [self addChild:_square1];
    [self addChild:_square2];
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.scaleMode = SKSceneScaleModeAspectFit;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self.physicsBody setRestitution:0];
        
        [self spawnCharacterLimbs];
        [self activateJointRope];
        [self spawnTestSquares];
        //[self makeShelf];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touch withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
//    if (_torso.physicsBody.dynamic) {
//        
//        [_torso.physicsBody setDynamic:NO];
//        
//        //        [_head.physicsBody setDynamic:NO];
//        //
//        //        [_armL.physicsBody setDynamic:NO];
//        //        [_armR.physicsBody setDynamic:NO];
//        //
//        //        [_handL.physicsBody setDynamic:NO];
//        //        [_handR.physicsBody setDynamic:NO];
//        //
//        //        [_legL.physicsBody setDynamic:NO];
//        //        [_legR.physicsBody setDynamic:NO];
//        //        [_footL.physicsBody setDynamic:NO];
//        //        [_footR.physicsBody setDynamic:NO];
//    }
    
    //UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    //CGPoint location2 = [touch locationInNode:self];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (UITouch *touch in [event allTouches]) {
        for (SKNode *node in nodes) {
            //go through nodes, get the zPosition if you want
            //int nodePos = node.zPosition;
            
            
            

            
            //or check the node against your nodes
            if ([node.name isEqualToString:@"torso"]) {
                [_torso setPosition:location];
            }
            if ([node.name isEqualToString:@"square1"]) {
                [_square1.physicsBody setDynamic:NO];
                [_square1 setPosition:location];
            }
            if ([node.name isEqualToString:@"square2"]) {
                [_square2.physicsBody setDynamic:NO];
                [_square2 setPosition:location2];
            }
            
            
        }
        
//        if (CGRectIntersectsRect(location.x, _torso.frame)) {
//            [_torso setPosition:location];
//        }
        //[_torso setPosition:location];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    CGPoint location2 = [touch locationInNode:self];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
        for (SKNode *node in nodes) {
            //go through nodes, get the zPosition if you want
            //int nodePos = node.zPosition;
            
            //or check the node against your nodes
            if ([node.name isEqualToString:@"torso"]) {
                [_torso setPosition:location];
            }
            if ([node.name isEqualToString:@"square1"]) {
                [_square1 setPosition:location];
            }
            if ([node.name isEqualToString:@"square2"]) {
                [_square2 setPosition:location2];
            }
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_torso.physicsBody.dynamic) {
        [_torso.physicsBody setDynamic:YES];
    }
    
    if (!_square1.physicsBody.dynamic) {
        [_square1.physicsBody setDynamic:YES];
    }
    if (!_square2.physicsBody.dynamic) {
        [_square2.physicsBody setDynamic:YES];
    }
    //  [_mySquare1.physicsBody setDynamic:YES];
    //  [_mySquare2.physicsBody setDynamic:YES];
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end







