import time
from pynput import keyboard 

class RobotController:
    def __init__(self, robot):
        self.robot = robot
        self.speed = 0
        self.is_moving = False

    def move_forward(self):
        self.speed = 5
        self.robot.set_wheel_speed(self.speed, self.speed)

    def move_backward(self):
        self.speed = -5
        self.robot.set_wheel_speed(self.speed, self.speed)

    def turn_left(self):
        self.robot.set_wheel_speed(-5, 5)  # Left wheel backward, right wheel forward

    def turn_right(self):
        self.robot.set_wheel_speed(5, -5)  # Left wheel forward, right wheel backward

    def stop(self):
        self.speed = 0
        self.robot.set_wheel_speed(0, 0)

def on_press(key):
    try:
        if key.char == 'w':  # Move forward
            controller.move_forward()
        elif key.char == 's':  # Move backward
            controller.move_backward()
        elif key.char == 'a':  # Turn left
            controller.turn_left()
        elif key.char == 'd':  # Turn right
            controller.turn_right()
    except AttributeError:
        pass

def on_release(key):
    controller.stop()  # Stop on key release
    if key == keyboard.Key.esc:  # Stop listener
        return False


robot = RoboSim.get_robot("YourRobotName")
controller = RobotController(robot)


with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()
