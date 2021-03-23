function love.load()

	require "easing"
	
	times = 0
	step = 0.01
	dir = 1

	states = {
		[1] = easing.in_sine,
		[2] = easing.out_sine,
		[3] = easing.in_out_sine,

		[4] = easing.in_cubic,
		[5] = easing.out_cubic,
		[6] = easing.in_out_cubic,

		[7] = easing.in_quint,
		[8] = easing.out_quint,
		[9] = easing.in_out_quint,

		[10] = easing.in_circ,
		[11] = easing.out_circ,
		[12] = easing.in_out_circ,

		[13] = easing.in_elastic,
		[14] = easing.out_elastic,
		[15] = easing.in_out_elastic,

		[16] = easing.in_quad,
		[17] = easing.out_quad,
		[18] = easing.in_out_quad,

		[19] = easing.in_quart,
		[20] = easing.out_quart,
		[21] = easing.in_out_quart,

		[22] = easing.in_expo,
		[23] = easing.out_expo,
		[24] = easing.in_out_expo,

		[25] = easing.in_back,
		[26] = easing.out_back,
		[27] = easing.in_out_back,

		[28] = easing.in_bounce,
		[29] = easing.out_bounce,
		[30] = easing.in_out_bounce
	}

	states_info = {
		[1] = "easing.in_sine",
		[2] = "easing.out_sine",
		[3] = "easing.in_out_sine",

		[4] = "easing.in_cubic",
		[5] = "easing.out_cubic",
		[6] = "easing.in_out_cubic",

		[7] = "easing.in_quint",
		[8] = "easing.out_quint",
		[9] = "easing.in_out_quint",

		[10] = "easing.in_circ",
		[11] = "easing.out_circ",
		[12] = "easing.in_out_circ",

		[13] = "easing.in_elastic",
		[14] = "easing.out_elastic",
		[15] = "easing.in_out_elastic",

		[16] = "easing.in_quad",
		[17] = "easing.out_quad",
		[18] = "easing.in_out_quad",

		[19] = "easing.in_quart",
		[20] = "easing.out_quart",
		[21] = "easing.in_out_quart",

		[22] = "easing.in_expo",
		[23] = "easing.out_expo",
		[24] = "easing.in_out_expo",

		[25] = "easing.in_back",
		[26] = "easing.out_back",
		[27] = "easing.in_out_back",

		[28] = "easing.in_bounce",
		[29] = "easing.out_bounce",
		[30] = "easing.in_out_bounce"
	}
	easing_state = 1
end

function love.update()
	times = times + step*dir

	--[[
	if times >= 1 then
		dir = -1
	elseif times <= 0 then
		dir = 1
	end
	]]

	times = math.max(0, math.min(1, times))
end


function love.keypressed(key, scancode, isrepeat)
   if key == "left" then
   		easing_state = easing_state - 1
   elseif key == "right" then
		easing_state = easing_state + 1
   end

   if key == "space" then
   		dir = dir * -1
   end
end

function love.draw()

	easing_state = math.max(1, math.min(30, easing_state))
	
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setBackgroundColor(0.1, 0.1, 0.3, a)
	love.graphics.print("Times: "..times, 10, 15)
	love.graphics.print("State: "..states_info[easing_state], 10, 32)

	love.graphics.setColor(0.2, 0.2, 0.8, 1)
	love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 100 * states[easing_state](times), 30)

end
