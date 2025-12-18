import os
import re
import sys

def extract_patches(root_dir):
    patches = []
    
    # regex to find the start of a fetchpatch2 call
    # matches 'fetchpatch2' followed optionally by whitespace and '{'
    
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if not filename.endswith('.nix'):
                continue
            
            filepath = os.path.join(dirpath, filename)
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
            except Exception as e:
                # print(f"Error reading {filepath}: {e}")
                continue
            
            # Find all occurrences of 'fetchpatch2'
            # We want to capture the whole expression.
            # Assuming it is `fetchpatch2 { ... }`
            
            # Use regex to find start indices
            for m in re.finditer(r'(?<!\w)fetchpatch2\s*\{', content):
                start_idx = m.start()
                
                # Find the opening brace
                open_brace_idx = content.find('{', start_idx)
                if open_brace_idx == -1:
                    continue
                
                # Count braces to find the end
                stack = 1
                current_idx = open_brace_idx + 1
                
                # We need to handle strings and comments inside the block to avoid mismatched braces
                in_string = False
                in_multiline_string = False
                
                while current_idx < len(content) and stack > 0:
                    char = content[current_idx]
                    
                    # Handle strings
                    if not in_string and not in_multiline_string:
                        # Check for multiline string ''
                        if content[current_idx:current_idx+2] == "''":
                            in_multiline_string = True
                            current_idx += 1 # skip one extra char
                        elif char == '"':
                            in_string = True
                        elif char == '{':
                            stack += 1
                        elif char == '}':
                            stack -= 1
                        # Note: Nix comments # or /* */
                        elif char == '#':
                            # consume until newline
                            newline_idx = content.find('\n', current_idx)
                            if newline_idx == -1:
                                current_idx = len(content) # End of file
                            else:
                                current_idx = newline_idx


                    elif in_multiline_string:
                         if content[current_idx:current_idx+2] == "''":
                             in_multiline_string = False
                             current_idx += 1
                    elif in_string:
                        if char == '"' and content[current_idx-1] != '\\': # Simple escape check
                             in_string = False
                    
                    current_idx += 1
                
                if stack == 0:
                    # Found the closing brace
                    call_block = content[start_idx:current_idx]
                    patches.append(f"({call_block})")

    return patches

def main():
    if len(sys.argv) > 1:
        root_dirs = sys.argv[1:]
    else:
        root_dirs = ['pkgs'] # Start searching from pkgs
        if not os.path.exists('pkgs'):
             # Fallback to current dir if pkgs doesn't exist (e.g. searching from root)
            root_dirs = ['.']


    all_patches = []
    for root in root_dirs:
        all_patches.extend(extract_patches(root))
    
    # Remove duplicates if any (based on string content)
    unique_patches = sorted(list(set(all_patches)))
    
    with open('patches.nix', 'w', encoding='utf-8') as f:
        f.write('{ fetchpatch2 }:\n\n')
        f.write('[\n')
        for patch in unique_patches:
            # Indent for better readability
            # strip trailing whitespace/newlines from patch
            patch = patch.strip()
            indented = patch.replace('\n', '\n  ')
            f.write(f"  {indented}\n")
        f.write(']\n')
    
    print(f"Extracted {len(unique_patches)} fetchpatch2 calls to patches.nix")

if __name__ == '__main__':
    main()
