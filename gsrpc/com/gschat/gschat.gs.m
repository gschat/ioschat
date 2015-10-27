#import <com/gschat/gschat.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSChatMail
+ (instancetype)init {
    return [[GSChatMail alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _MailID = @"";
        
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

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_MailID];


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
        	_MailID = [reader ReadString];

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
    
        case 0:{

            UInt32 ret =  [ _service Prepare];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt32 :ret];
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 1:{
			GSChatMail* arg0 = [[GSChatMail alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				[arg0 unmarshal:reader ];
			}


            UInt64 ret = [ _service Put: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt64 :ret];
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 2:{
			UInt32 arg0 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadUInt32];
			}

			UInt32 arg1 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

				arg1 = [reader ReadUInt32];
			}


            UInt32 ret = [ _service Sync: arg0  withArg1:arg1 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt32 :ret];
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
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


- (id<GSPromise>) Prepare{
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt32 callreturn = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt32];
		}


        return ((id<GSPromise>(^)(UInt32))block)(callreturn);;
    });
    
}

- (id<GSPromise>) Put:(GSChatMail*) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
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

- (id<GSPromise>) Sync:(UInt32) arg0  withArg1:(UInt32) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)2;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg1];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt32 callreturn = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt32];
		}


        return ((id<GSPromise>(^)(UInt32))block)(callreturn);;
    });
    
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
    
        case 0:{
			GSChatMail* arg0 = [[GSChatMail alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				[arg0 unmarshal:reader ];
			}


            [ _service Push: arg0 ];
            
        }
    
        case 1:{
			UInt32 arg0 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadUInt32];
			}


            [ _service Notify: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
            return callreturn;
            
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


- (NSError*) Push:(GSChatMail*) arg0 {
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
    

    
    return [_channel Post: call];
    
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
    
        case 0:{
			NSString* arg0 = @"";

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadString];
			}

			NSMutableArray * arg1 = [NSMutableArray arrayWithCapacity: 0];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

				UInt16 imax4 = [reader ReadUInt16];

				for(UInt16 i4 = 0; i4 < imax4; i4 ++ ){

					GSChatProperty* v4 = [[GSChatProperty alloc] init];

					[v4 unmarshal:reader ];

					[ arg1 addObject: v4];

				}
			}


            NSMutableArray * ret = [ _service Login: arg0  withArg1:arg1 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt16:ret.count];
			for(id v3 in ret){
				GSChatProperty* vv3 = (GSChatProperty*)v3;
				[vv3 marshal: writer];
			}
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 1:{
			NSMutableArray * arg0 = [NSMutableArray arrayWithCapacity: 0];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				UInt16 imax4 = [reader ReadUInt16];

				for(UInt16 i4 = 0; i4 < imax4; i4 ++ ){

					GSChatProperty* v4 = [[GSChatProperty alloc] init];

					[v4 unmarshal:reader ];

					[ arg0 addObject: v4];

				}
			}


            [ _service Logoff: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
            return callreturn;
            
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

		[writer WriteUInt16:arg1.count];
		for(id v2 in arg1){
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

		[writer WriteUInt16:arg0.count];
		for(id v2 in arg0){
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






@implementation GSChatIMPushService{
    id<GSChatIMPush> _service;
}
+ (instancetype) init:(id<GSChatIMPush>)service withID:(UInt16) serviceID {
    return [[GSChatIMPushService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatIMPush>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
        case 0:{
			NSMutableData * arg0 = [[NSMutableData alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadBytes];
			}


            [ _service Register: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
            return callreturn;
            
        }
    
        case 1:{

             [ _service Unregister];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            callreturn.Service = call.Service;
            
            return callreturn;
            
        }
    
    }
    return nil;
}

@end


@implementation GSChatIMPushRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatIMPushRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Register:(NSMutableData *) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteBytes: arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
    
}

- (id<GSPromise>) Unregister{
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
    
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
    
    case GSChatServiceTypePush:
       return @"GSChatServiceTypePush";
    
    case GSChatServiceTypeAuth:
       return @"GSChatServiceTypeAuth";
    
    case GSChatServiceTypeClient:
       return @"GSChatServiceTypeClient";
    
    case GSChatServiceTypeStatus:
       return @"GSChatServiceTypeStatus";
    
    default:
       return @"Unknown val";
   }
}

@end


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
    [writer WriteByte :(UInt8)2];

    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Key];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Value];


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
        	_Value = [reader ReadString];

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
