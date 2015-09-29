#import <com/gschat/gschat.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSChatProperty
+ (instancetype)init {
    return [[GSChatProperty alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = @"";
        
        _Value = @"";
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteString :_Key];


	[writer WriteString :_Value];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Key = [reader ReadString];


	_Value = [reader ReadString];


}

@end



@implementation GSChatIMServerService{
    id<GSChatIMServer> _service;
}
+ (instancetype) init:(id<GSChatIMServer>)service withID:(UInt16) serviceID {
    return [[GSChatIMServerService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatIMServer>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		GSChatMail* arg0 = [[GSChatMail alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			[arg0 unmarshal:reader ];
		}


        UInt64 ret = [ _service Put: arg0 ];
        
        GSResponse * callreturn  = [GSResponse init];
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt64 :ret];
			callreturn.Content = writer.content;

		}


        callreturn.ID = call.ID;
        callreturn.Service = call.Service;
        return callreturn;
        
        break;
    }
    
    case 1:
    {
		UInt32 arg0 = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadUInt32];
		}


        [ _service Pull: arg0 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSChatIMServerRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatIMServerRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Put:(GSChatMail*) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg0 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt64 callreturn = (UInt64)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt64];
		}


        return ((id<GSPromise>(^)(UInt64))block)(callreturn);;
    });
}

- (id<GSPromise>) Pull:(UInt32) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

@end






@implementation GSChatIMAuthService{
    id<GSChatIMAuth> _service;
}
+ (instancetype) init:(id<GSChatIMAuth>)service withID:(UInt16) serviceID {
    return [[GSChatIMAuthService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatIMAuth>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		NSString* arg0 = @"";

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadString];
		}

		NSMutableArray * arg1 = [NSMutableArray arrayWithCapacity: 0];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

			UInt16 imax3 = [reader ReadUInt16];

			for(UInt16 i3 = 0; i3 < imax3; i3 ++ ){

				GSChatProperty* v3 = [[GSChatProperty alloc] init];

				[v3 unmarshal:reader ];

				[ arg1 addObject: v3];

			}
		}


        NSMutableArray * ret = [ _service Login: arg0  withArg1:arg1 ];
        
        GSResponse * callreturn  = [GSResponse init];
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt16:ret.count];			for(id v3 in ret){
				GSChatProperty* vv3 = (GSChatProperty*)v3;
				[vv3 marshal: writer];
			}
			callreturn.Content = writer.content;

		}


        callreturn.ID = call.ID;
        callreturn.Service = call.Service;
        return callreturn;
        
        break;
    }
    
    case 1:
    {
		NSMutableArray * arg0 = [NSMutableArray arrayWithCapacity: 0];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			UInt16 imax3 = [reader ReadUInt16];

			for(UInt16 i3 = 0; i3 < imax3; i3 ++ ){

				GSChatProperty* v3 = [[GSChatProperty alloc] init];

				[v3 unmarshal:reader ];

				[ arg0 addObject: v3];

			}
		}


        [ _service Logoff: arg0 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSChatIMAuthRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatIMAuthRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Login:(NSString*) arg0  withArg1:(NSMutableArray *) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteString :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt16:arg1.count];		for(id v2 in arg1){
			GSChatProperty* vv2 = (GSChatProperty*)v2;
			[vv2 marshal: writer];
		}
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		NSMutableArray * callreturn = [NSMutableArray arrayWithCapacity: 0];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			UInt16 imax3 = [reader ReadUInt16];

			for(UInt16 i3 = 0; i3 < imax3; i3 ++ ){

				GSChatProperty* v3 = [[GSChatProperty alloc] init];

				[v3 unmarshal:reader ];

				[ callreturn addObject: v3];

			}
		}


        return ((id<GSPromise>(^)(NSMutableArray *))block)(callreturn);;
    });
}

- (id<GSPromise>) Logoff:(NSMutableArray *) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt16:arg0.count];		for(id v2 in arg0){
			GSChatProperty* vv2 = (GSChatProperty*)v2;
			[vv2 marshal: writer];
		}
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

@end




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

	[writer WriteString :_Text];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Text = [reader ReadString];


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

	[writer WriteString :_Key];


	[writer WriteString :_Name];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Key = [reader ReadString];


	_Name = [reader ReadString];


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

	[writer WriteString :_Key];


	[writer WriteString :_Name];


	[writer WriteInt16 :_Duration];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Key = [reader ReadString];


	_Name = [reader ReadString];


	_Duration = [reader ReadInt16];


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

}
- (void) unmarshal:(id<GSReader>) reader {

}

- (NSError*) asNSError {
    NSString *domain = @"GSChatUserNotFound";

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
        
        _SQID = (UInt32)0;
        
        _TS = (UInt64)0;
        
        _Sender = @"";
        
        _Receiver = @"";
        
        _Type = GSChatMailTypeSingle;
        
        _Content = @"";
        
        _Attachments = [NSMutableArray arrayWithCapacity: 0];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteUInt32 :_SQID];


	[writer WriteUInt64 :_TS];


	[writer WriteString :_Sender];


	[writer WriteString :_Receiver];


	[GSChatMailTypeHelper marshal: _Type withWriter: writer];


	[writer WriteString :_Content];


	[writer WriteUInt16:_Attachments.count];	for(id v1 in _Attachments){
		GSChatAttachment* vv1 = (GSChatAttachment*)v1;
		[vv1 marshal: writer];
	}


}
- (void) unmarshal:(id<GSReader>) reader {

	_SQID = [reader ReadUInt32];


	_TS = [reader ReadUInt64];


	_Sender = [reader ReadString];


	_Receiver = [reader ReadString];


	_Type = [GSChatMailTypeHelper unmarshal: reader];


	_Content = [reader ReadString];


	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSChatAttachment* v1 = [[GSChatAttachment alloc] init];

		[v1 unmarshal:reader ];

		[ _Attachments addObject: v1];

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

	[GSChatAttachmentTypeHelper marshal: _Type withWriter: writer];


	[writer WriteBytes: _Content];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Type = [GSChatAttachmentTypeHelper unmarshal: reader];


	_Content = [reader ReadBytes];


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
    
    case GSChatAttachmentTypeCustomer:
       return @"GSChatAttachmentTypeCustomer";
    
    default:
       return @"Unknown val";
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

	[writer WriteFloat64 :_Longitude];


	[writer WriteFloat64 :_Latitude];


	[writer WriteString :_Address];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Longitude = [reader ReadFloat64];


	_Latitude = [reader ReadFloat64];


	_Address = [reader ReadString];


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

	[writer WriteString :_Key];


	[writer WriteString :_Name];


	[writer WriteInt16 :_Duration];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Key = [reader ReadString];


	_Name = [reader ReadString];


	_Duration = [reader ReadInt16];


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

}
- (void) unmarshal:(id<GSReader>) reader {

}

- (NSError*) asNSError {
    NSString *domain = @"GSChatUserAuthFailed";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end

@implementation GSChatServiceTypeHelper

+ (void) marshal:(GSChatServiceType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSChatServiceType) unmarshal:(id<GSReader>) reader {
    return (GSChatServiceType)[reader ReadByte];
}

+ (NSString*) tostring:(GSChatServiceType)val {
    
    switch(val)
    {
    
    case GSChatServiceTypeUnknown:
       return @"GSChatServiceTypeUnknown";
    
    case GSChatServiceTypeIM:
       return @"GSChatServiceTypeIM";
    
    case GSChatServiceTypeAPNS:
       return @"GSChatServiceTypeAPNS";
    
    case GSChatServiceTypeAuth:
       return @"GSChatServiceTypeAuth";
    
    case GSChatServiceTypeClient:
       return @"GSChatServiceTypeClient";
    
    default:
       return @"Unknown val";
   }
}

@end




@implementation GSChatIMClientService{
    id<GSChatIMClient> _service;
}
+ (instancetype) init:(id<GSChatIMClient>)service withID:(UInt16) serviceID {
    return [[GSChatIMClientService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatIMClient>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		GSChatMail* arg0 = [[GSChatMail alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			[arg0 unmarshal:reader ];
		}


        [ _service Push: arg0 ];
        
        break;
    }
    
    case 1:
    {
		UInt32 arg0 = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadUInt32];
		}


        [ _service Notify: arg0 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSChatIMClientRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatIMClientRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Push:(GSChatMail*) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg0 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

- (id<GSPromise>) Notify:(UInt32) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

@end



