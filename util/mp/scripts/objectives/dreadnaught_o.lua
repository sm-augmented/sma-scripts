LuaQ           TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    (main chunk)           a      Ē           Ē       ~    Ē                   x    Ē	    2 2 6  2 2 2 2 2 2 2 2	 x   	,	  \
 x	  
.
 Ē  x
6
 x  
8
 Ē  x
:
 x 
<
 x 
>
 x 
@
	 x 
B
 Ē 
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
 Ē  x   
N
 Ē  x  
P
 Ē  x
R  *      multiplayer      objectives    Dreadnought 
   Objective    NewObjectiveType    __index    Network_RegisterStaticVarByRef      DreadnoughtObjective    ls_captured  īG   text       ?   A   A   @  @@1   ebps\multiplayer\common\dreadnought_capturepoint 	   Activate    OnSharedVariablesUpdated    networkFunctions      DreadnoughtPointCaptured 	   Captured     DreadnoughtPointCapturedCommand    Lost    PlayCaptureActions    PlayLostActions    TriggerActions    DreadnoughtUpdate    End    HideCapturePoints    HideCapturePoint    ShowCapturePoint    CreateDreadnoughtControlPoint    onDreadnoughtDied    onDreadnoughtPointCaptured    `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua                 @                                            table           key              Dreadnought `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:Activate    F    å               9  ~  Ē    \  Ē  Ē               9
          \ 
              '  ņ˙8  \ *                 9            9 2                 9            9 2 2 Ē          2Y q 2 Ē 	        
 	        	!      	      
" Ē#  
% Ē&   
 9
( Ē)  

    9
+ Ē,  
	 
. Ē/       
1 Ē2 4      5        6 Ē7 9 Ē: <                     \         
      z        
      ?}        
      A¤˙r   \ 1 Ē2 4      5        D ĒE 9 Ē: G        @ 	   
 1 Ē2 4      5        H ĒI 9 Ē: K          D ĒE 9 Ē: L       @    
M~  N      loadout   ?   group    Spawn 	   position    GetPosition    team 	   TEAM_ANY      teams    pairs      multiplayer      assets 	   teamList    score        capturePoints    data    captureDuration    A   decapDuration    A   Group_Count      Group_GetEntityAt      markers 	   scartype   
   ST_STRING      Marker_Exists      Marker_FromName      Network_AddCapturePoint      table      insert    events    Event_AddPointCaptured      networkFunctions      DreadnoughtPointCaptured    index    owningTeam   ČB   active     capturePointFlowIndex    dreadnoughtPoints    Event_AddTimerWithData      DreadnoughtUpdate    Event_DreadnoughtDied      onDreadnoughtDied    CreateDreadnoughtControlPoint    HideCapturePoints     å                                                                                                                                               #   #   %   %   %   %   %   %   %   %   %   %   %   %   %   %   &   &   &   &   &   &   &   &   &   &   &   &   &   &   (   (   (   (   (   (   (   (   (   )   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   +   ,   ,   ,   ,   ,   ,   ,   ,   -   -   -   -   -   -   .   .   .   .   .   1   1   1   1   1   1   1   1   1   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   5   5   5   5   5   6   6   6   6   6   6   6   7   7   7   7   7   7   7   8   8   8   8   8   8   8   (   <   >   >   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   @   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   C   C   C   C   C   C   C   C   C   C   C   E   E   F         self     ä      (for generator)    ,      (for state)    ,      (for control)    ,      k    *      v    *      captureDuration <   ä      decapDuration J   ä      (for index) R   Ž      (for limit) R   Ž      (for step) R   Ž      i S   ­      CPT_Proximity T   ­      entity [   ­      marker d   ­      capturePointID    ­         UPDATE_RATE_SEC %   INITIAL_DREADNOUGHT_POINT_SPAWN_TIME `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua %   Dreadnought:OnSharedVariablesUpdated J   n    \                9    @          9  @  \    @        Ē           > 9         9  \
                       9             
                      9 Ē  
        
  9 Ē 	 
 2  9 Ē 	 
 2      	       	  ž˙8        capturePoints     pairs      owningTeam    active    Entity_GetCapturePointEntity      Entity_StartEntityAction      neutral    Entity_StopEntityAction       \   K   K   K   K   K   L   O   O   O   O   O   O   P   P   P   S   S   S   S   U   U   U   U   U   U   U   V   V   V   V   V   W   W   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   [   [   [   [   [   [   [   _   _   _   _   _   _   _   _   _   _   _   a   a   a   a   d   d   d   d   d   e   e   e   e   e   e   g   g   g   g   g   j   j   j   j   j   j   j   U   k   n         self     [   
   localData    [      (for generator)    [      (for state)    [      (for control)    [      k    Y      v    Y      entity B   Y      
   LocalData `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua *   networkFunctions.DreadnoughtPointCaptured p   t     
     Ē  Ē            UI_ShowCoopObjectiveText      ls_captured   	   Captured     
   q   q   q   q   q   r   r   r   r   t         capturePointID     	      team     	      self     	       `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:Captured v       W                    h I 9                                     @D
                              		D
 Ē 
      
       Ē        
 d   9	 2 Ē           9       
         9   9  ņ˙8         PlayCaptureActions    capturePoints    owningTeam    @   teams    score    index    HideCapturePoint    capturePointFlowIndex   ?   multiplayer      dreadnoughtGameplayFlow    table      getn    pairs      ShowCapturePoint     W   w   w   w   y   y   y   y   y   y   y   {   {   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }   }                                                                                                                                                                                    self     V      team     V      capturePointID     V      pointIndex '   V      nextPointIndex .   V   
   flowTable 6   V      numFlowEntries =   V      (for generator) F   U      (for state) F   U      (for control) F   U      k G   S      v G   S         POINT_CAPTURE_SCORE_AMOUNT `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua 1   networkFunctions.DreadnoughtPointCapturedCommand                                  data             `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:Lost                               PlayLostActions    owner 	   complete                                     self            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:PlayCaptureActions ĸ   Ļ                            9                         9                               data    captureActions    TriggerActions         Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   Ŗ   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   ¤   Ļ         self           team            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:PlayLostActions ¨   Ŧ                            9                         9                               data    lostActions    TriggerActions         Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Š   Ē   Ē   Ē   Ē   Ē   Ē   Ē   Ē   Ē   Ē   Ē   Ē   Ŧ         self           team            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:TriggerActions Ž   ˛     
     Ē   
 9 Ē              	    ō˙8        pairs      multiplayer      actions    TriggerAction        ¯   ¯   ¯   ¯   ¯   °   °   °   °   °   °   °   °   °   °   °   ¯   °   ˛         self           actionList           (for generator)          (for state)          (for control)          k          v           `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua #   networkFunctions.DreadnoughtUpdate ´   Ã     +     Ē ~ \ 2t Ē          9	 Ē	 	      
        		 Ē 
         		        	h  9	 	    â˙8        Network_GetScoreLimit   sËG   pairs      teams    table      insert    score !   Hud_ShowObjectiveDominationScore   	   Complete     +   ļ   ļ   ļ   ¸   ¸   ¸   š   š   š   š   š   š   š   ē   ē   ē   ē   ē   ē   ē   ē   ē   ē   ģ   ģ   ģ   ģ   ģ   ģ   ģ   ģ   Ŋ   Ŋ   Ŋ   Ŋ   Ŋ   ž   ž   ž   ŋ   š   Ā   Ã   	      event     *      self     *   
   scoreGoal    *      objectiveInfo    *      (for generator)    *      (for state)    *      (for control)    *      k    (      v    (       `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:End Å   Ũ     
/     2 4  Ē           9	        	d  9          ô˙8 Ē           9	         9 j   9    õ˙8   9   9~  	     ŋ   pairs      teams    score     	   Complete    Draw     /   Į   Č   É   Ę   Ę   Ę   Ę   Ę   Ę   Ę   Ë   Ë   Ë   Ë   Ë   Ė   Ė   Ė   Í   Ę   Î   Ņ   Ņ   Ņ   Ņ   Ņ   Ņ   Ņ   Ō   Ō   Ō   Ō   Ō   Ō   Ō   Ķ   Ņ   Ô   ×   ×   Ø   Ø   Ø   Ø   Ú   Ú   Ũ         self     .      highestScore    .      highestTeam    .      isDraw    .      (for generator) 	         (for state) 	         (for control) 	         k 
         v 
         (for generator)    &      (for state)    &      (for control)    &      k    $      v    $       `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:HideCapturePoints ß   ä          Ē          
 9              	 Ē    ō˙8  	      pairs      capturePoints    active     Network_DisableCapturePoint          ā   ā   ā   ā   ā   ā   ā   á   á   á   á   á   á   á   â   â   â   â   ā   â   ä         self           (for generator)          (for state)          (for control)          k          v           `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:HideCapturePoint æ   ë                        Ē          capturePoints    active     Network_DisableCapturePoint          č   č   č   č   č   č   č   é   é   é   é   ë         self           capturePointID            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua    Dreadnought:ShowCapturePoint î   ķ                        Ē          capturePoints    active    Network_EnableCapturePoint          đ   đ   đ   đ   đ   đ   đ   ņ   ņ   ņ   ņ   ķ         self           capturePointID            `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua /   networkFunctions.CreateDreadnoughtControlPoint õ      r     Ē              Ē  2	 Ē
 
                Ē   Ē   
 9 Ē      9 Ē     @ @ Ē  2 2 @	 Ē 
  ! Ē"   2	
	$ Ē% 
  2	
' Ē(      
 2
	 Ē
 *      +       , Ē- / Ē0 2          3 Ē4  6 Ē7  9         \ 9       
      ;u
   <      multiplayer      dreadnoughtControlPoints    bias_team_none    Util_GetRandomNumber     ?   table      getn 	   scartype   
   ST_STRING      Marker_Exists      Marker_FromName      Group_Create              Group_SpawnEntities      Marker_GetPositionOnGround      Group_GetEntityAt      Network_AddDreadnoughtPoint      insert    events "   Event_AddDreadnoughtPointCaptured      networkFunctions      onDreadnoughtPointCaptured    Group_Clear      Group_Dealloc      dreadnoughtPoints    active     r   ÷   ÷   ÷   ÷   ÷   ÷   ÷   ÷   ų   ų   ų   ų   ų   ų   ų   ų   ų   ų   ų   ų   ų   ų   ú   ú   ú   ú   ú   ú   ú   ú   û   û   û   û   û   û   ü   ü   ü   ü   ü                                                  	  	  	  	  	  	  	  	  	  
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
 Ē               \ 
 Ē               4 Ē  Ē 
       @   
        HideCapturePoints   ?   @   teams    score    action    RandomizeTeamSpawning    team 
   locations    mkr_start_marine    multiplayer      actions    TriggerAction    mkr_start_ork    Event_AddTimerWithData      networkFunctions      CreateDreadnoughtControlPoint     B                                                   !  "  #  $  &  &  &  &  &  &  &  &  &  &  (  )  *  +  ,  -  -  -  -  -  -  -  -  -  -  .  0  0  0  0  0  0  0  0  0  0  0  2        team     A      self     A      dreadnoughtKillingTeam    A      tempAction    A         DREADNOUGHT_KILL_SCORE_AMOUNT    DREADNOUGHT_POINT_SPAWN_TIME `   @d:\projects\w40kaction\branches\ship_pc\assets\maps\util\mp\scripts\objectives\dreadnaught.lua ,   networkFunctions.onDreadnoughtPointCaptured 4  _    Z    Ē              Ē 	         9	
       
        

       
  9	 	  9  î˙8 2    9 2 \! Ē              
 
4 Ē          9    9 Ē  2 Ē   Ē    
 ?! Ē"  $ Ē%  ' Ē(    9  á˙8  *      capturePointFlowIndex   ?   multiplayer      dreadnoughtGameplayFlow    pairs      capturePoints    index    ShowCapturePoint    @   action    RandomizeTeamSpawning    team 
   locations    tdm_mkr_spawn_01    actions    TriggerAction    dreadnoughtPoints    Group_Create       
   Group_Add      Entity_GetCapturePointEntity      active     Network_RemoveDreadnoughtPoint      Group_DespawnEntities      Group_Dealloc       Z   6  8  8  8  8  8  8  8  8  :  :  :  :  :  :  :  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  <  <  <  =  :  >  B  C  C  D  H  I  J  K  M  M  M  M  M  M  M  M  M  M  N  P  P  P  P  P  P  P  Q  Q  S  S  S  S  T  T  T  T  T  T  T  T  V  W  W  W  W  Y  Y  Y  Y  Z  Z  Z  Z  \  P  ]  _        cpid     Y      team     Y      self     Y   
   flowTable 	   Y      (for generator)    !      (for state)    !      (for control)    !      k          v          nonDreadnoughtTeam "   Y      tempAction )   Y      (for generator) :   Y      (for state) :   Y      (for control) :   Y      k ;   W      v ;   W      grp A   W       a                                                                                                
                           F   F   F      H   n   n   J   p   p   t   p         v                      Ļ   ĸ   Ŧ   ¨   ˛   Ž   ´   ´   Ã   ´   Ũ   Å   ä   ß   ë   æ   ķ   î   õ   õ           õ       2  2  2    4  4  _  4  _  
      Dreadnought    `      UPDATE_RATE_SEC !   `   %   INITIAL_DREADNOUGHT_POINT_SPAWN_TIME "   `      DREADNOUGHT_POINT_SPAWN_TIME #   `   !   DREADNOUGHT_CONTROL_CAPTURE_TIME $   `      DREADNOUGHT_CONTROL_DECAP_TIME %   `      POINT_CAPTURE_SCORE_AMOUNT &   `      DREADNOUGHT_KILL_SCORE_AMOUNT '   `      DREADNOUGHT_CONTROL_EBP (   `   
   LocalData -   `              