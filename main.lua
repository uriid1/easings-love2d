function love.load()

	require "easing"
	
	times = 0
	step = 0.01
	dir = 1

	states = {
		[1] = ease.in_sine,
		[2] = ease.out_sine,
		[3] = ease.in_out_sine,

		[4] = ease.in_cubic,
		[5] = ease.out_cubic,
		[6] = ease.in_out_cubic,

		[7] = ease.in_quint,
		[8] = ease.out_quint,
		[9] = ease.in_out_quint,

		[10] = ease.in_circ,
		[11] = ease.out_circ,
		[12] = ease.in_out_circ,

		[13] = ease.in_elastic,
		[14] = ease.out_elastic,
		[15] = ease.in_out_elastic,

		[16] = ease.in_quad,
		[17] = ease.out_quad,
		[18] = ease.in_out_quad,

		[19] = ease.in_quart,
		[20] = ease.out_quart,
		[21] = ease.in_out_quart,

		[22] = ease.in_expo,
		[23] = ease.out_expo,
		[24] = ease.in_out_expo,

		[25] = ease.in_back,
		[26] = ease.out_back,
		[27] = ease.in_out_back,

		[28] = ease.in_bounce,
		[29] = ease.out_bounce,
		[30] = ease.in_out_bounce
	}

	states_info = {
		[1] = "ease.in_sine",
		[2] = "ease.out_sine",
		[3] = "ease.in_out_sine",

		[4] = "ease.in_cubic",
		[5] = "ease.out_cubic",
		[6] = "ease.in_out_cubic",

		[7] = "ease.in_quint",
		[8] = "ease.out_quint",
		[9] = "ease.in_out_quint",

		[10] = "ease.in_circ",
		[11] = "ease.out_circ",
		[12] = "ease.in_out_circ",

		[13] = "ease.in_elastic",
		[14] = "ease.out_elastic",
		[15] = "ease.in_out_elastic",

		[16] = "ease.in_quad",
		[17] = "ease.out_quad",
		[18] = "ease.in_out_quad",

		[19] = "ease.in_quart",
		[20] = "ease.out_quart",
		[21] = "ease.in_out_quart",

		[22] = "ease.in_expo",
		[23] = "ease.out_expo",
		[24] = "ease.in_out_expo",

		[25] = "ease.in_back",
		[26] = "ease.out_back",
		[27] = "ease.in_out_back",

		[28] = "ease.in_bounce",
		[29] = "ease.out_bounce",
		[30] = "ease.in_out_bounce"
	}
	ease_state = 1
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
   		ease_state = ease_state - 1
   elseif key == "right" then
		ease_state = ease_state + 1
   end

   if key == "space" then
   		dir = dir * -1
   end
end

function love.draw()

	ease_state = math.max(1, math.min(30, ease_state))
	
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setBackgroundColor(0.1, 0.1, 0.3, a)
	love.graphics.print("Times: "..times, 10, 15)
	love.graphics.print("State: "..states_info[ease_state], 10, 32)

	love.graphics.setColor(0.2, 0.2, 0.8, 1)
	love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 100 * states[ease_state](times), 30)

end
