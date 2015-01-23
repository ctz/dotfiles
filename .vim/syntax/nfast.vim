" Vim syntax file
" Language:     nCipher nC-series module log files
" Maintainer:   James Harvey <james@ncipher.com>
" Last Change:  2001 July 6

" OK, this was a bit of fun waiting for builds to finish. I always meant to learn how to do these...
" This file will highlight nfast log files, nfkm log files (a little bit) and trial scripts.

" To use it, put something like this in your my*.vim files (see :help mysyntaxfile for details) 

" in myscriptsfile:
"   if getline(1) =~ 'NFast_' ||  getline(1) =~ 'nFast KM' || getline(1) =~ 'command.tag'
"     set ft=nfast
"   endif
"
" in myfiletypesfile:
"   au! BufRead,BufNewFile *.trial  set filetype=nfast
" 
" in mysyntaxfile (change filename for whatever you've called this syntax file...):
"   au! Syntax nfast so ~/nfast.vim
" 
" and you should be ready to go.

" TODO: put more keywords in, so you can check spelling of stuff in trial scripts.
"       possibly add some 'error' highlighted stuff for trial scripts.

" Remove old syntax stuff...
syn clear

" Sets of keywords that appear...
" Phew. I should learn to make marshmallow do this :-)
syn keyword     nfCmdBasic      BignumOp Fail GeneratePrime GenerateRandom ModExp ModExpCrt ModExpCrtPar ModuleInfo NewEnquiry NoOp RetryFailedModule StatEnumTree StatGetValues contained
syn keyword     nfCmdKM         ChangeSharePIN ChannelOpen ChannelUpdate Decrypt DeriveKey Destroy Duplicate Encrypt EraseFile EraseShare Export FormatToken GenerateKey GenerateKeyPair GenerateLogicalToken GetACL GetAppData GetChallenge GetKeyInfo GetKML GetKMList GetLogicalTokenInfo GetSlotInfo GetSlotList GetWhichModule Hash Import LoadBlob LoadLogicalToken MakeBlob MergeKeyIDs ReadFile ReadShare RSAImmedSignDecrypt RSAImmedVerifyDecrypt SetACL SetAppData Sign Verify WriteFile WriteShare UpdateMergedKey GetClientHash GetKeyInfoEx SendShare ReceiveShare ImportSlot UnimportSlot ExportSlot GetLogicalTokenInfoEx GetShareACL StaticFeatureEnable CheckUserAction contained
syn keyword     nfCmdPriv       ClearUnit InitialiseUnit RemoveKM SetKNSO SetKM contained
syn keyword     nfCmdProg       Maintenance ProgrammingBegin ProgrammingBeginChunk ProgrammingLoadBlock ProgrammingEndChunk ProgrammingEnd ProgrammingGetKeyList LoadRaw GenerateKLF GetKLF SignModuleState SetNSOPerms FirmwareAuthenticate contained 
syn keyword     nfCmdHS         ExistingClient InsertSoftToken NewClient RemoveSoftToken PauseForNotifications ANModuleReset ANReadTerminated ANPleaseClearUnitSoon ANPleaseClearUnitNow PollSlotList PollModuleState ANModuleChangeEvent ANSlotChangeEvent ImpathKXBegin ImpathKXFinish ImpathGetInfo ImpathSend ImpathReceive ServerSendShare AddRemoteServerPermission RemoveRemoteServerPermission ListRemoteServerPermission ANRemoteSlotDisconnected  contained
syn keyword     nfCmdOld        OldEnquiry OldClearUnit OldExtEnquiry OldMakeBlob contained
syn keyword     nfCmdSEE        NVMemAlloc NVMemList NVMemOp NVMemFree GetRTC SetRTC CreateSEEWorld SEEJob CreateBuffer LoadBuffer SetSEEMachine GetWorldSigners GetTicket TraceSEEWorld ForeignTokenOpen ForeignTokenCmd contained
syn keyword     nfCmdUnknown    ServerStats contained
syn keyword     nfCmdError      ErrorReturn contained

syn keyword     nfCmdSW         NFast_Submit NFast_Wait NFast_Connect contained

" Some errors. Most errors will just come up as something special.
syn keyword     nfErrorOK       OK contained
syn keyword     nfErrorBad      Failed CrossModule MetaDataProtection AttemptedDowngrade HardwareFailed ServerFailed contained
syn keyword     nfError1        UnknownCommand NotYetImplemented Malformed UnknownID AccessDenied ObjectInUse UseLimitExceeded TimeLimitExceeded BadCertKeyHash BadCertSignature VerifyFailed TypeMismatch BadShareState BadTokenData NoMemory UnknownParameter UnknownFlag BlobTypeUnknown BufferFull UnitReset ClientUnknown InvalidParameter InvalidState InvalidModule contained
syn keyword     nfError2        TokenAssemblyFailed UnknownKM LogTokenNotPresent InvalidMonitorMultiple DecryptFailed WriteProtected OutOfRange PrivilegedCommand UnknownSlot UnknownKeyHash TokenAuthFailed UnknownMechanism NoSpaceOnToken TokenNotFormatted UnknownTokenType TokenIOError EncryptFailed InvalidACL PhysTokenNotPresent MechanismNotExpected UnknownDefault contained
syn keyword     nfError3        SlotFull UnknownChallenge AsynchNotification InvalidData ServerNotRunning OSErrorErrno TransactionNotFound TransactionNotYetComplete ServerConnectionLost StrictFIPS140 UnknownStatus Cancelled UnsupportedChannelType ArithmeticError OpStackOverflow OpStackUnderflow NegativeResult HostDataInvalid HostDataAccessFailed NoUpcall contained 
syn keyword     nfError4        NotAvailable MalformedCertificate InvalidCertificate ObjectNotReady BadMachineImage BadWorldImage SEEWorldFailed AlreadyExists InvalidMergedKey HostDataAccessDenied NoHostMemory NoModuleMemory SoftwareFailed OperationFailed IncorrectToken contained
syn keyword     nfError5        ReadOnly RemoteServerFailed SlotUnconnected NSTBadMessage nCErrno ImpathNotReady ImpathTimeLimitExceeded ImpathDataLimitExceeded ImpathReplay ImpathMsgTypeMismatch NoKXGroup ServerAccessDenied InProgress InvalidRM InvalidSlot UnknownPermID ForeignTokenLocked OperationTimeout SSLUnexpectedMessage SSLBadRecordMac SSLDecryptionFailure contained
syn keyword     nfError6        SSLDecompressionFailure SSLHandshakeFailure SSLNoCertificate SSLBadCertificate SSLUnsupportedCertificate SSLCertificateRevoked SSLCertificateExpired SSLCertificateUnknown SSLIllegalParameter SSLUnknownCA SSLAccessDenied SSLDecodeError SSLDecryptError SSLExportRestriction SSLProtocolVersion SSLInsufficientSecurity contained
syn keyword     nfError7        SSLInternalError SSLUserCanceled SSLNoRenogotiation UnknownKey UserCancelled KeyNotLoaded HostUnknownKeyType IncorrectRepositoryName  InvalidHostDataIdentifier contained

syn cluster     nfError         contains=nfError1,nfError2,nfError3,nfError4,nfError5,nfError6,nfError7


" Number - optional 0x followed by 8 hex digits;
"        - decimal number at the end of a line
"        - line full of nothing but hex digits and whitespace.
" make sure that nfNumEOL is first; it is the most generic. 
syn match       nfNumEOL        "-\=\d\+\( bytes\)\=" contained
syn match       nfNum8          "\x\{8}" contained
syn match       nfNum2          "\<\x\x\>" contained
syn match       nfNumHex        "0x\x\+" contained
" SOL, Optional ws, number, (ws, number) at least once, optional ws, EOL
syn match       nfNumLine       "^\s*\x\+\(\s\+\x\+\)\+\s*$"                 
" next one not 'contained' because we can have strings on their own (e.g. o/p from enquiry)
syn region      nfString        start=+"+ skip=+\\"+ end=+"+ 
syn cluster     nfGeneric       contains=nfNum8,nfNumEOL,nfString,nfNumHex
" Command lines. First one makes the dotty bits a different colour, last one makes sure
" we only pick up command names in .cmd lines (and not in ACLs, frex)
syn region      nfCmdLine       start="^NFast_" end="$" contains=@nfGeneric transparent
syn region      nfArgs          start="\(reply\|command\)\=\." skip="\[.\+]" end="\s" contained
syn region      nfArgsAnyLine   start="\(reply\|command\)\=\." end="$" contains=nfArgs,@nfGeneric transparent 
syn region      nfArgsCmdLine   start="\.cmd" end="$" contains=nfArgs,nfCmd.*,@nfGeneric transparent
syn region      nfArgsStatLine  start="\.status" end="$" contains=nfArgs,nfError.*,@nfGeneric transparent

" Let's do some noddy nfkm stuff.
syn match       nfkmFileName    "\f\+\([\/]\f\+\)\+"
syn region      nfkmDebug       start="nFast KM: debug:" end="$" contains=nfCmd.*,nfError.*,nfkmFileName
syn region      nfkmError       start="nFast KM: error:" end="$" contains=nfCmd.*,nfError.*,nfkmFileName
" Are there any more NFKM info types? Warning, Information?

" ... and some (reasonably) noddy CSP log file stuff.
syn match       cspDate         "^\d\d:\d\d:\d\d.\d\d\d" contained
syn match       cspError        "\(0x\)\?800900\d\d" contained
syn match       cspFunction     "\WCP\w\+\W"hs=s+1,he=e-1 contained
syn region      cspLogLine      start="^\d\d:\d\d:\d\d.\d\d\d : " end="$" contains=csp.*,nfCmd.*,nfError.*
syn match       cspDumpAddress  "^\x\{8}" contained
syn region      cspDumpLine     start="^\x\{8}: " end="$" contains=nfNum2,cspDumpAddress

syn sync minlines=5

if !exists("did_nfast_syntax_inits")
  let did_nfast_syntax_inits = 1
  " OK. Let's make this colourful.
  hi link nfCmdBasic    Operator
  hi link nfCmdKM       Operator
  hi link nfCmdPriv     PreProc
  hi link nfCmdProg     PreProc
  hi link nfCmdHS       PreProc
  hi link nfCmdOld      Operator
  hi link nfCmdSEE      Operator
  hi link nfCmdUnknown  Operator
  hi link nfCmdError    Special
  
  hi link nfCmdSW       Label
  
  " setting next one to something different to nfErrorBad causes 
  " Failed and CrossModule to come up in a different colour
  hi link nfErrorBad    Error
  hi link nfError1      ToDo
  hi link nfError2      ToDo
  hi link nfError3      ToDo
  hi link nfError4      ToDo
  hi link nfError5      ToDo
  hi link nfError6      ToDo
  hi link nfError7      ToDo

  hi link nfNum8        Number
  hi link nfNum2        Number
  hi link nfNumHex      Number
  hi link nfNumLine     Number
  hi link nfNumEOL      Number
  hi link nfString      Identifier

  hi link nfArgs        Structure

  hi link nfkmFileName  Structure
  hi link nfkmDebug     Normal
  hi link nfkmError     Special

  hi link cspDate       Number
  hi link cspError      ToDo
  hi link cspFunction   Special
  hi link cspDumpAddress Type
  hi link cspDumpLine   Identifier
endif
