#import <com/gschat/shared.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSChatAttachmentText
+ (instancetype)init {
    return [[GSChatAttachmentText alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Text = @"";
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)1];

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Text];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Text = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatUserNotFound
+ (instancetype)init {
    return [[GSChatUserNotFound alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSChatUserNotFound";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSChatServiceHelper

+ (void) marshal:(GSChatService) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSChatService) unmarshal:(id<GSReader>) reader {
    return (GSChatService)[reader ReadByte];
}

+ (NSString*) tostring:(GSChatService)val {
    
    switch(val)
    {
    
    case GSChatServiceUnknown:
       return @"GSChatServiceUnknown";
    
    case GSChatServiceMailHub:
       return @"GSChatServiceMailHub";
    
    case GSChatServicePush:
       return @"GSChatServicePush";
    
    case GSChatServiceAuth:
       return @"GSChatServiceAuth";
    
    case GSChatServiceClient:
       return @"GSChatServiceClient";
    
    case GSChatServiceUserBinder:
       return @"GSChatServiceUserBinder";
    
    case GSChatServicePushServiceProvider:
       return @"GSChatServicePushServiceProvider";
    
    case GSChatServiceDHKeyResolver:
       return @"GSChatServiceDHKeyResolver";
    
    case GSChatServiceUserResolverListener:
       return @"GSChatServiceUserResolverListener";
    
    case GSChatServiceUserResolver:
       return @"GSChatServiceUserResolver";
    
    case GSChatServiceGateway:
       return @"GSChatServiceGateway";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSChatAttachment
+ (instancetype)init {
    return [[GSChatAttachment alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Type = GSChatAttachmentTypeText;
        
        _Content = [[NSMutableData alloc] init];
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)2];

    [writer WriteByte :(UInt8)GSTagI32];
	[GSChatAttachmentTypeHelper marshal: _Type withWriter: writer];


    [writer WriteByte :(UInt8)((GSTagI8 << 4)|GSTagList)];
	[writer WriteBytes: _Content];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Type = [GSChatAttachmentTypeHelper unmarshal: reader];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Content = [reader ReadBytes];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatAttachmentTypeHelper

+ (void) marshal:(GSChatAttachmentType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSChatAttachmentType) unmarshal:(id<GSReader>) reader {
    return (GSChatAttachmentType)[reader ReadByte];
}

+ (NSString*) tostring:(GSChatAttachmentType)val {
    
    switch(val)
    {
    
    case GSChatAttachmentTypeText:
       return @"GSChatAttachmentTypeText";
    
    case GSChatAttachmentTypeImage:
       return @"GSChatAttachmentTypeImage";
    
    case GSChatAttachmentTypeVideo:
       return @"GSChatAttachmentTypeVideo";
    
    case GSChatAttachmentTypeAudio:
       return @"GSChatAttachmentTypeAudio";
    
    case GSChatAttachmentTypeGPS:
       return @"GSChatAttachmentTypeGPS";
    
    case GSChatAttachmentTypeCMD:
       return @"GSChatAttachmentTypeCMD";
    
    case GSChatAttachmentTypeCustomer:
       return @"GSChatAttachmentTypeCustomer";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSChatResourceNotFound
+ (instancetype)init {
    return [[GSChatResourceNotFound alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSChatResourceNotFound";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSChatResourceBusy
+ (instancetype)init {
    return [[GSChatResourceBusy alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSChatResourceBusy";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSChatAttachmentVideo
+ (instancetype)init {
    return [[GSChatAttachmentVideo alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = @"";
        
        _Name = @"";
        
        _Duration = (SInt16)0;
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)3];

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Key];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Name];


    [writer WriteByte :(UInt8)GSTagI16];
	[writer WriteInt16 :_Duration];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Key = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Name = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Duration = [reader ReadInt16];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatUserAuthFailed
+ (instancetype)init {
    return [[GSChatUserAuthFailed alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSChatUserAuthFailed";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSChatAttachmentImage
+ (instancetype)init {
    return [[GSChatAttachmentImage alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = @"";
        
        _Name = @"";
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)2];

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Key];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Name];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Key = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Name = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatAttachmentAudio
+ (instancetype)init {
    return [[GSChatAttachmentAudio alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = @"";
        
        _Name = @"";
        
        _Duration = (SInt16)0;
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)3];

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Key];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Name];


    [writer WriteByte :(UInt8)GSTagI16];
	[writer WriteInt16 :_Duration];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Key = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Name = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Duration = [reader ReadInt16];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatAttachmentCMD
+ (instancetype)init {
    return [[GSChatAttachmentCMD alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Command = @"";
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)1];

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Command];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Command = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatMailTypeHelper

+ (void) marshal:(GSChatMailType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSChatMailType) unmarshal:(id<GSReader>) reader {
    return (GSChatMailType)[reader ReadByte];
}

+ (NSString*) tostring:(GSChatMailType)val {
    
    switch(val)
    {
    
    case GSChatMailTypeSingle:
       return @"GSChatMailTypeSingle";
    
    case GSChatMailTypeMulti:
       return @"GSChatMailTypeMulti";
    
    case GSChatMailTypeSystem:
       return @"GSChatMailTypeSystem";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSChatUnexpectSQID
+ (instancetype)init {
    return [[GSChatUnexpectSQID alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSChatUnexpectSQID";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSChatMail
+ (instancetype)init {
    return [[GSChatMail alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = (UInt64)0;
        
        _SQID = (UInt32)0;
        
        _TS = (UInt64)0;
        
        _Sender = @"";
        
        _Receiver = @"";
        
        _Type = GSChatMailTypeSingle;
        
        _Content = @"";
        
        _Attachments = [NSMutableArray arrayWithCapacity: 0];
        
        _Extension = [[NSMutableData alloc] init];
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)9];

    [writer WriteByte :(UInt8)GSTagI64];
	[writer WriteUInt64 :_ID];


    [writer WriteByte :(UInt8)GSTagI32];
	[writer WriteUInt32 :_SQID];


    [writer WriteByte :(UInt8)GSTagI64];
	[writer WriteUInt64 :_TS];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Sender];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Receiver];


    [writer WriteByte :(UInt8)GSTagI32];
	[GSChatMailTypeHelper marshal: _Type withWriter: writer];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Content];


    [writer WriteByte :(UInt8)((GSTagTable << 4)|GSTagList)];
	[writer WriteUInt16:_Attachments.count];
	for(id v1 in _Attachments){
		GSChatAttachment* vv1 = (GSChatAttachment*)v1;
		[vv1 marshal: writer];
	}


    [writer WriteByte :(UInt8)((GSTagI8 << 4)|GSTagList)];
	[writer WriteBytes: _Extension];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_ID = [reader ReadUInt64];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_SQID = [reader ReadUInt32];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_TS = [reader ReadUInt64];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Sender = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Receiver = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Type = [GSChatMailTypeHelper unmarshal: reader];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Content = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSChatAttachment* v1 = [[GSChatAttachment alloc] init];

		[v1 unmarshal:reader ];

		[ _Attachments addObject: v1];

	}

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Extension = [reader ReadBytes];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end

@implementation GSChatAttachmentGPS
+ (instancetype)init {
    return [[GSChatAttachmentGPS alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Longitude = (Float64)0;
        
        _Latitude = (Float64)0;
        
        _Address = @"";
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)3];

    [writer WriteByte :(UInt8)GSTagI64];
	[writer WriteFloat64 :_Longitude];


    [writer WriteByte :(UInt8)GSTagI64];
	[writer WriteFloat64 :_Latitude];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Address];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Longitude = [reader ReadFloat64];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Latitude = [reader ReadFloat64];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Address = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end
