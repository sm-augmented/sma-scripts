LuaQ           TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    (main chunk)           a      ª           ª       ~    ª                   x    ª	    2 2 6  2 2 2 2 2 2 2 2	 x   	,	  \
 x	  
.
 ª  x
6
 x  
8
 ª  x
:
 x 
<
 x 
>
 x 
@
	 x 
B
 ª 
 x
D
 x 
F
 x 
H
 x 
J
 x 
L
 ª  x   
N
 ª  x  
P
 ª  x
R  *      multiplayer      objectives    Dreadnought 
   Objective    NewObjectiveType    __index    Network_RegisterStaticVarByRef      DreadnoughtObjective    ls_captured  ïG   text       ?   A   A   @  @@1   ebps\multiplayer\common\dreadnought_capturepoint 	   Activate    OnSharedVariablesUpdated    networkFunctions      DreadnoughtPointCaptured 	   Captured     DreadnoughtPointCapturedCommand    Lost    PlayCaptureActions    PlayLostActions    TriggerActions    DreadnoughtUpdate    End    HideCapturePoints    HideCapturePoint    ShowCapturePoint    CreateDreadnoughtControlPoint    onDreadnoughtDied    onDreadnoughtPointCaptured    `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua                 @                                            table           key              Dreadnought `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:Activate    F    å               9  ~  ª    \  ª  ª               9
          \ 
              '  ñÿ8  \ *                 9            9 2                 9            9 2 2 ª          2Y q 2 ª 	        
 	        	!      	      
" ª#  
% ª&   
 9
( ª)  

    9
+ ª,  
	 
. ª/       
1 ª2 4      5        6 ª7 9 ª: <                     \         
      z        
      ?}        
      A¤ÿr   \ 1 ª2 4      5        D ªE 9 ª: G        @ 	   
 1 ª2 4      5        H ªI 9 ª: K          D ªE 9 ª: L       @    
M~  N      loadout   ?   group    Spawn 	   position    GetPosition    team 	   TEAM_ANY      teams    pairs      multiplayer      assets 	   teamList    score        capturePoints    data    captureDuration    A   decapDuration    A   Group_Count      Group_GetEntityAt      markers 	   scartype   
   ST_STRING      Marker_Exists      Marker_FromName      Network_AddCapturePoint      table      insert    events    Event_AddPointCaptured      networkFunctions      DreadnoughtPointCaptured    index    owningTeam   ÈB   active     capturePointFlowIndex    dreadnoughtPoints    Event_AddTimerWithData      DreadnoughtUpdate    Event_DreadnoughtDied      onDreadnoughtDied    CreateDreadnoughtControlPoint    HideCapturePoints     å                                                                                                                                               #   #   %   %   %   %   %   %   %   %   %   %   %   %   %   %   &   &   &   &   &   &   &   &   &   &   &   &   &   &   (   (   (   (   (   (   (   (   (   )   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   +   ,   ,   ,   ,   ,   ,   ,   ,   -   -   -   -   -   -   .   .   .   .   .   1   1   1   1   1   1   1   1   1   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   5   5   5   5   5   6   6   6   6   6   6   6   7   7   7   7   7   7   7   8   8   8   8   8   8   8   (   <   >   >   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   C   C   C   C   C   C   C   C   C   C   C   E   E   F         self     ä      (for generator)    ,      (for state)    ,      (for control)    ,      k    *      v    *      captureDuration <   ä      decapDuration J   ä      (for index) R   ®      (for limit) R   ®      (for step) R   ®      i S   ­      CPT_Proximity T   ­      entity [   ­      marker d   ­      capturePointID    ­         UPDATE_RATE_SEC %   INITIAL_DREADNOUGHT_POINT_SPAWN_TIME `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua %   Dreadnought:OnSharedVariablesUpdated J   n    \                9    @          9  @  \    @        ª           > 9         9  \
                       9             
                      9 ª  
        
  9 ª 	 
 2  9 ª 	 
 2      	       	  ¾ÿ8        capturePoints     pairs      owningTeam    active    Entity_GetCapturePointEntity      Entity_StartEntityAction      neutral    Entity_StopEntityAction       \   K   K   K   K   K   L   O   O   O   O   O   O   P   P   P   S   S   S   S   U   U   U   U   U   U   U   V   V   V   V   V   W   W   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   [   [   [   [   [   [   [   _   _   _   _   _   _   _   _   _   _   _   a   a   a   a   d   d   d   d   d   e   e   e   e   e   e   g   g   g   g   g   j   j   j   j   j   j   j   U   k   n         self     [   
   localData    [      (for generator)    [      (for state)    [      (for control)    [      k    Y      v    Y      entity B   Y      
   LocalData `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua *   networkFunctions.DreadnoughtPointCaptured p   t     
     ª  ª            UI_ShowCoopObjectiveText      ls_captured   	   Captured     
   q   q   q   q   q   r   r   r   r   t         capturePointID     	      team     	      self     	       `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:Captured v       W                    h I 9                                     @D
                              		D
 ª 
      
       ª        
 d   9	 2 ª           9       
         9   9  ñÿ8         PlayCaptureActions    capturePoints    owningTeam    @   teams    score    index    HideCapturePoint    capturePointFlowIndex   ?   multiplayer      dreadnoughtGameplayFlow    table      getn    pairs      ShowCapturePoint     W   w   w   w   y   y   y   y   y   y   y   {   {   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }                                                                                                                                                                                    self     V      team     V      capturePointID     V      pointIndex '   V      nextPointIndex .   V   
   flowTable 6   V      numFlowEntries =   V      (for generator) F   U      (for state) F   U      (for control) F   U      k G   S      v G   S         POINT_CAPTURE_SCORE_AMOUNT `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua 1   networkFunctions.DreadnoughtPointCapturedCommand                                  data             `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:Lost                               PlayLostActions    owner 	   complete                                     self            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:PlayCaptureActions ¢   ¦                            9                         9                               data    captureActions    TriggerActions         £   £   £   £   £   £   £   £   £   £   £   £   £   £   £   £   £   £   £   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¦         self           team            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:PlayLostActions ¨   ¬                            9                         9                               data    lostActions    TriggerActions         ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ©   ª   ª   ª   ª   ª   ª   ª   ª   ª   ª   ª   ª   ¬         self           team            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:TriggerActions ®   ²     
     ª   
 9 ª              	    òÿ8        pairs      multiplayer      actions    TriggerAction        ¯   ¯   ¯   ¯   ¯   °   °   °   °   °   °   °   °   °   °   °   ¯   °   ²         self           actionList           (for generator)          (for state)          (for control)          k          v           `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua #   networkFunctions.DreadnoughtUpdate ´   Ã     +     ª ~ \ 2t ª          9	 ª	 	      
        		 ª 
         		        	h  9	 	    âÿ8        Network_GetScoreLimit   sËG   pairs      teams    table      insert    score !   Hud_ShowObjectiveDominationScore   	   Complete     +   ¶   ¶   ¶   ¸   ¸   ¸   ¹   ¹   ¹   ¹   ¹   ¹   ¹   º   º   º   º   º   º   º   º   º   º   »   »   »   »   »   »   »   »   ½   ½   ½   ½   ½   ¾   ¾   ¾   ¿   ¹   À   Ã   	      event     *      self     *   
   scoreGoal    *      objectiveInfo    *      (for generator)    *      (for state)    *      (for control)    *      k    (      v    (       `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:End Å   Ý     
/     2 4  ª           9	        	d  9          ôÿ8 ª           9	         9 j   9    õÿ8   9   9~  	     ¿   pairs      teams    score     	   Complete    Draw     /   Ç   È   É   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ë   Ë   Ë   Ë   Ë   Ì   Ì   Ì   Í   Ê   Î   Ñ   Ñ   Ñ   Ñ   Ñ   Ñ   Ñ   Ò   Ò   Ò   Ò   Ò   Ò   Ò   Ó   Ñ   Ô   ×   ×   Ø   Ø   Ø   Ø   Ú   Ú   Ý         self     .      highestScore    .      highestTeam    .      isDraw    .      (for generator) 	         (for state) 	         (for control) 	         k 
         v 
         (for generator)    &      (for state)    &      (for control)    &      k    $      v    $       `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:HideCapturePoints ß   ä          ª          
 9              	 ª    òÿ8  	      pairs      capturePoints    active     Network_DisableCapturePoint          à   à   à   à   à   à   à   á   á   á   á   á   á   á   â   â   â   â   à   â   ä         self           (for generator)          (for state)          (for control)          k          v           `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:HideCapturePoint æ   ë                        ª          capturePoints    active     Network_DisableCapturePoint          è   è   è   è   è   è   è   é   é   é   é   ë         self           capturePointID            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:ShowCapturePoint î   ó                        ª          capturePoints    active    Network_EnableCapturePoint          ð   ð   ð   ð   ð   ð   ð   ñ   ñ   ñ   ñ   ó         self           capturePointID            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua /   networkFunctions.CreateDreadnoughtControlPoint õ      r     ª              ª  2	 ª
 
                ª   ª   
 9 ª      9 ª     @ @ ª  2 2 @	 ª 
  ! ª"   2	
	$ ª% 
  2	
' ª(      
 2
	 ª
 *      +       , ª- / ª0 2          3 ª4  6 ª7  9         \ 9       
      ;u
   <      multiplayer      dreadnoughtControlPoints    bias_team_none    Util_GetRandomNumber     ?   table      getn 	   scartype   
   ST_STRING      Marker_Exists      Marker_FromName      Group_Create              Group_SpawnEntities      Marker_GetPositionOnGround      Group_GetEntityAt      Network_AddDreadnoughtPoint      insert    events "   Event_AddDreadnoughtPointCaptured      networkFunctions      onDreadnoughtPointCaptured    Group_Clear      Group_Dealloc      dreadnoughtPoints    active     r   ÷   ÷   ÷   ÷   ÷   ÷   ÷   ÷   ù   ù   ù   ù   ù   ù   ù   ù   ù   ù   ù   ù   ù   ù   ú   ú   ú   ú   ú   ú   ú   ú   û   û   û   û   û   û   ü   ü   ü   ü   ü                                                  	  	  	  	  	  	  	  	  	  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
                                                    event     q      self     q      spawnTable    q      point    q      capDuration *   q      decapDuration +   q      group /   q      CPT_Proximity 0   q      CPT_blueprint 1   q      capturePointEntity @   q      capturePointID I   q      !   DREADNOUGHT_CONTROL_CAPTURE_TIME    DREADNOUGHT_CONTROL_DECAP_TIME    DREADNOUGHT_CONTROL_EBP `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua #   networkFunctions.onDreadnoughtDied   2   	B    ~ 2    9 2                                   @D \	
 ª               \ 
 ª               4 ª  ª 
       @   
        HideCapturePoints   ?   @   teams    score    action    RandomizeTeamSpawning    team 
   locations    mkr_start_marine    multiplayer      actions    TriggerAction    mkr_start_ork    Event_AddTimerWithData      networkFunctions      CreateDreadnoughtControlPoint     B                                                   !  "  #  $  &  &  &  &  &  &  &  &  &  &  (  )  *  +  ,  -  -  -  -  -  -  -  -  -  -  .  0  0  0  0  0  0  0  0  0  0  0  2        team     A      self     A      dreadnoughtKillingTeam    A      tempAction    A         DREADNOUGHT_KILL_SCORE_AMOUNT    DREADNOUGHT_POINT_SPAWN_TIME `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua ,   networkFunctions.onDreadnoughtPointCaptured 4  _    Z    ª              ª 	         9	
       
        

       
  9	 	  9  îÿ8 2    9 2 \! ª              
 
4 ª          9    9 ª  2 ª   ª    
 ?! ª"  $ ª%  ' ª(    9  áÿ8  *      capturePointFlowIndex   ?   multiplayer      dreadnoughtGameplayFlow    pairs      capturePoints    index    ShowCapturePoint    @   action    RandomizeTeamSpawning    team 
   locations    tdm_mkr_spawn_01    actions    TriggerAction    dreadnoughtPoints    Group_Create       
   Group_Add      Entity_GetCapturePointEntity      active     Network_RemoveDreadnoughtPoint      Group_DespawnEntities      Group_Dealloc       Z   6  8  8  8  8  8  8  8  8  :  :  :  :  :  :  :  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  <  <  <  =  :  >  B  C  C  D  H  I  J  K  M  M  M  M  M  M  M  M  M  M  N  P  P  P  P  P  P  P  Q  Q  S  S  S  S  T  T  T  T  T  T  T  T  V  W  W  W  W  Y  Y  Y  Y  Z  Z  Z  Z  \  P  ]  _        cpid     Y      team     Y      self     Y   
   flowTable 	   Y      (for generator)    !      (for state)    !      (for control)    !      k          v          nonDreadnoughtTeam "   Y      tempAction )   Y      (for generator) :   Y      (for state) :   Y      (for control) :   Y      k ;   W      v ;   W      grp A   W       a                                                                                                
                           F   F   F      H   n   n   J   p   p   t   p         v                      ¦   ¢   ¬   ¨   ²   ®   ´   ´   Ã   ´   Ý   Å   ä   ß   ë   æ   ó   î   õ   õ           õ       2  2  2    4  4  _  4  _  
      Dreadnought    `      UPDATE_RATE_SEC !   `   %   INITIAL_DREADNOUGHT_POINT_SPAWN_TIME "   `      DREADNOUGHT_POINT_SPAWN_TIME #   `   !   DREADNOUGHT_CONTROL_CAPTURE_TIME $   `      DREADNOUGHT_CONTROL_DECAP_TIME %   `      POINT_CAPTURE_SCORE_AMOUNT &   `      DREADNOUGHT_KILL_SCORE_AMOUNT '   `      DREADNOUGHT_CONTROL_EBP (   `   
   LocalData -   `              