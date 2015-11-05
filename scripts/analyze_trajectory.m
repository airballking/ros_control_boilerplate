clear
clc
format long g
clf

while 1
    sampled_data = csvread('~/ros/recorded_trajectory_1.csv',1,0);
    %assign columns into seperate variable names - this is made quickly using the
    %header names and find-replace command
    i=1;
    timestamp=sampled_data(:,i);i=i+1;
    joint1_pos=sampled_data(:,i);i=i+1;
    joint1_vel=sampled_data(:,i);i=i+3;
    
    joint2_pos=sampled_data(:,i);i=i+1;
    joint2_vel=sampled_data(:,i);i=i+3;
    
    joint3_pos=sampled_data(:,i);i=i+1;
    joint3_vel=sampled_data(:,i);i=i+3;
    
    joint4_pos=sampled_data(:,i);i=i+1;
    joint4_vel=sampled_data(:,i);i=i+3;
    
    joint5_pos=sampled_data(:,i);i=i+1;
    joint5_vel=sampled_data(:,i);i=i+3;
    
    joint6_pos=sampled_data(:,i);i=i+1;
    joint6_vel=sampled_data(:,i);i=i+3;
    
    joint7_pos=sampled_data(:,i);i=i+1;
    joint7_vel=sampled_data(:,i);i=i+3;
    

    time_start_end = [timestamp(1,1) timestamp(end,1)];
    joint2_upper = 0;
    joint3_lower = -3.92699081699;
    joint3_upper = 0.785398163397;
    
    plot_position = 0;
    
    if (plot_position)
        plot(...
             timestamp, joint1_pos,'r', ...%time_start_end, [-pi, -pi], 'r--', time_start_end, [pi, pi], 'r--',...
             timestamp, joint2_pos,'y', ...%time_start_end, [-pi,-pi], 'yo',time_start_end, [joint2_upper,joint2_upper], 'y--',...
             timestamp, joint3_pos,'m', ...%time_start_end, [joint3_lower,joint3_lower], 'm--',time_start_end, [joint3_upper,joint3_upper], 'm--',...
             timestamp, joint4_pos,'c',...
             timestamp, joint5_pos,'g',...
             timestamp, joint6_pos,...
             timestamp, joint7_pos)

        xlabel('Time')
        ylabel('Position')
        legend('Joint 1 Pos',...%'Continous Low', 'Continuous High',...
                'Joint 2 Pos',...%'Joint 2 Low', 'Joint 2 High',...
                'Joint 3 Pos',...%'Joint 3 Low', 'Joint 3 High',...
                'Joint 4 Pos',...
                'Joint 5 Pos',...
                'Joint 6 Pos',...
                'Joint 7 Pos')

        title('Position Trajectory')
    else
        plot(...
             timestamp, joint1_vel,'r', ...%time_start_end, [-pi, -pi], 'r--', time_start_end, [pi, pi], 'r--',...
             timestamp, joint2_vel,'y', ...%time_start_end, [-pi,-pi], 'yo',time_start_end, [joint2_upper,joint2_upper], 'y--',...
             timestamp, joint3_vel,'m', ...%time_start_end, [joint3_lower,joint3_lower], 'm--',time_start_end, [joint3_upper,joint3_upper], 'm--',...
             timestamp, joint4_vel,'c',...
             timestamp, joint5_vel,'g',...
             timestamp, joint6_vel,...
             timestamp, joint7_vel)

        xlabel('Time')
        ylabel('Velocity')
        legend('Joint 1 vel',...%'Continous Low', 'Continuous High',...
                'Joint 2 vel',...%'Joint 2 Low', 'Joint 2 High',...
                'Joint 3 vel',...%'Joint 3 Low', 'Joint 3 High',...
                'Joint 4 vel',...
                'Joint 5 vel',...
                'Joint 6 vel',...
                'Joint 7 vel')

        title('Velocity Trajectory')
    end
    
    %pause(1)
    break
end