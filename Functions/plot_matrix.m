%% Plot matrix

function [ ] = plot_matrix(matrix, type, t)
% plot_matrix plot the matrix in imput showing the value in each cell with
% a related colorbar 

figure
imagesc(matrix);
if type == "r"
    title(sprintf('Range Matrix at Time %d', t));
elseif type == "a"
    title(sprintf('Azimuth Matrix at Time %d', t));
elseif type == "e"
    title(sprintf('Elevation Matrix at Time %d', t));
end

for j = 1:size(matrix, 1)
    for k = 1:size(matrix, 1)

        if matrix(j, k)>eps

            % Display values as text 
            text(k, j, sprintf('%.2f', matrix(j, k)), 'Color', 'w', 'FontSize', 8, 'HorizontalAlignment', 'center');
        end
    end
end

colorbar;
xlabel('Satellite Index');
ylabel('Satellite Index');

