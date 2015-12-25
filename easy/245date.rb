input = File.readlines('input.txt')

input.map! { |i| i.split(/[\/,\-,\s]/)}

input.map! { |i| i[0].length != 4 ? [i[2],i[0],i[1]] : i }

input.map! {|i| i[0].length != 4 ? ['20'+i[0],i[1],i[2]] : i}

input.map! {|i| i.map! {|j| j.length != 2 ? '0'+j : j}}

input.map! {|i| puts i.join('-')}