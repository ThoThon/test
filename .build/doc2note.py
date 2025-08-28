import requests


def get_google_doc_text(doc_url: str) -> str:
    # Lấy file_id từ link (phần sau "document/d/" và trước "/edit")
    try:
        file_id = doc_url.split("/d/")[1].split("/")[0]
    except IndexError:
        raise ValueError("Link Google Docs không hợp lệ")

    export_url = f"https://docs.google.com/document/d/{file_id}/export?format=txt"

    response = requests.get(export_url)
    response.raise_for_status()  # Báo lỗi nếu không truy cập được

    return response.text


if __name__ == "__main__":
    doc_link = "https://docs.google.com/document/d/1TsmKEE6U-jfo8vXxYKcXXQq1tQEdNiGLM5q16VJCr5Y/edit?usp=sharing"

    print("📖 Đang đọc nội dung change log từ google doc")
    text = get_google_doc_text(doc_link)

    # Lưu vào file note.txt
    with open(".build/note.txt", "w", encoding="utf-8") as f:
        f.write(text)

    print("✅ Nội dung đã được lưu vào note.txt")
