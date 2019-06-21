function [ e ] = benchmark_func2017( x,varargin )
% you need download for benchmark_func2017 http://web.mysites.ntu.edu.sg/epnsugan/PublicSite/Shared%20Documents/CEC-2017/Bound-Constrained/codes.rar and extract same folder
for y=1:size(x(:,1))
   e(y,1)=cec17_func(x(y,:)',varargin{1});  % cec2017
end
end

