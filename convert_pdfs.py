import os
import fitz  # PyMuPDF
import sys

def convert_pdf_to_md(pdf_path):
    """
    Extracts text from a PDF and saves it as a Markdown file.
    """
    try:
        doc = fitz.open(pdf_path)
        md_content = f"# {os.path.basename(pdf_path)}\n\n"
        
        for page_num in range(len(doc)):
            page = doc.load_page(page_num)
            text = page.get_text("text")
            md_content += f"## Page {page_num + 1}\n\n{text}\n\n"
        
        md_path = os.path.splitext(pdf_path)[0] + ".md"
        with open(md_path, "w", encoding="utf-8") as f:
            f.write(md_content)
        
        print(f"Successfully converted: {pdf_path} -> {md_path}")
        return True
    except Exception as e:
        print(f"Error converting {pdf_path}: {e}")
        return False

def main(root_dir):
    """
    Recursively finds and converts all PDF files in root_dir.
    """
    converted_count = 0
    error_count = 0
    
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            if file.lower().endswith(".pdf"):
                pdf_path = os.path.join(root, file)
                if convert_pdf_to_md(pdf_path):
                    converted_count += 1
                else:
                    error_count += 1
    
    print(f"\nFinished! Converted: {converted_count}, Errors: {error_count}")

if __name__ == "__main__":
    # Base directory to search for PDFs
    base_dir = "/Users/antoinebleuze/Library/Mobile Documents/com~apple~CloudDocs/Documents/projet xcode/Flow"
    main(base_dir)
