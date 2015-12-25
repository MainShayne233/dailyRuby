print File.read('input.txt').split(' ').map!{|w| w.length > 3 ? "#{w[0]}#{w[1..-2].split(//).shuffle!.join}#{w[-1]}" : w}.join(' ')


