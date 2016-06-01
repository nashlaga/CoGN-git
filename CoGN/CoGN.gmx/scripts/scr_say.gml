///scr_say(message)

message=argument0

width=1920
height=400

draw_set_alpha(0.5)
draw_roundrect_colour(10,800,1910,1070,c_black,c_black,false)
draw_set_alpha(1)

// Set colour to white
draw_set_colour(c_white)
draw_set_font(font0)
// Are we past the width? Line Break
// This has to be before getting the last_space variable or it wont work right
if (string_width(str) > width-padding-padding) {
    //remove space and replace with line break
    message = string_delete(message,last_space,1)
    message = string_insert("#",message,last_space)
    ds_list_add(start,last_space+1)
}

// Make sure we have not reached the end
if count <= string_length(message) {
    //If at space set last variable
    if string_char_at(message,count) == " " {
        last_space = count
    }
    //incriment the count
    count++
}
// did we go past the bottom? Move up
if (string_height(str) > height-padding) {
    line++   
}

//grab the string
str = string_copy(message,ds_list_find_value(start,line) , count-ds_list_find_value(start,line))

//Draw Text
draw_text(10+padding,800+padding, str)
