##by NOPEname


#input:
# 		format:		scoreboard
#		objective: 	math_trig
#		name: 		in
#		format:		angle in degrees, scaled by 100		(example: set 100 for 1° )

#use:				<this>
#preserves input: 	no	(values outside [0..36000] will be wrapped into range)

#output:
#		format: 	scoreboard
#		objective: 	math_trig
#		name: 		out
#		format:		scaled by 10000		(example: 936 stands for 0.0936 )
#		accuracy:	max error: 0.0005	(scaled -> 5 )

#additional information:
#		methode used: Bhaskar-Stroethoff (https://wiki.tcl-lang.org/page/Indian+Math+Bhaskara+%281%29+Sine+formula+and+extensions%2C+history+of+math++#a0ccfcf15f6b7964bb0cc284e2af6981086e2a18a991cfd83a4883c5b5e4ef80)


scoreboard players operation in math_trig %= 36000 math_trig
scoreboard players operation t_in math_trig = in math_trig
scoreboard players operation t_in math_trig %= 18000 math_trig

scoreboard players set t_xx math_trig 18000
scoreboard players operation t_xx math_trig -= t_in math_trig
scoreboard players operation t_in_sq math_trig = t_in math_trig
scoreboard players operation t_in_sq math_trig *= t_in math_trig
scoreboard players operation t_xx_sq math_trig = t_xx math_trig
scoreboard players operation t_xx_sq math_trig *= t_xx math_trig
scoreboard players operation t_inxx math_trig = t_in math_trig
scoreboard players operation t_inxx math_trig *= t_xx math_trig

scoreboard players operation out math_trig = 20 math_trig
scoreboard players operation out math_trig *= t_inxx math_trig
scoreboard players set tmp1 math_trig 405000
scoreboard players operation tmp2 math_trig = t_inxx math_trig
scoreboard players operation tmp2 math_trig /= 1000 math_trig
scoreboard players operation tmp1 math_trig -= tmp2 math_trig
scoreboard players operation out math_trig /= tmp1 math_trig

scoreboard players operation tmp0 math_trig = t_inxx math_trig
scoreboard players operation tmp0 math_trig /= 10000 math_trig
scoreboard players operation tmp0 math_trig *= 310 math_trig
scoreboard players operation tmp0 math_trig /= 648 math_trig
scoreboard players operation out math_trig += tmp0 math_trig

scoreboard players operation t_in_sq math_trig /= 10000 math_trig
scoreboard players operation t_xx_sq math_trig /= 10000 math_trig
scoreboard players set tmp0 math_trig 10
scoreboard players operation tmp0 math_trig *= t_in_sq math_trig
scoreboard players operation tmp0 math_trig *= t_xx_sq math_trig
scoreboard players operation tmp0 math_trig /= 583200 math_trig
scoreboard players operation out math_trig += tmp0 math_trig

execute if score in math_trig matches 18001.. run scoreboard players operation out math_trig *= -1 math_trig

###scoreboard players operation out math_trig /= 10 math_trig
