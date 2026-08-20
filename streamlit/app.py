"""
CGV AI 영화 추천 챗봇 - Streamlit UI

접속 주소: http://localhost:8501
"""
import streamlit as st
import requests
import os

st.set_page_config(page_title="CGV AI 영화 추천", page_icon="🎬", layout="centered")

BACKEND_URL = os.getenv("BACKEND_URL", "http://backend:8000")

st.title("🎬 CGV AI 영화 추천")
st.markdown("장르, 분위기, 인원수에 맞는 영화와 상영 시간을 추천해드립니다!")
st.divider()

if "messages" not in st.session_state:
    st.session_state.messages = [
        {"role": "assistant", "content": "안녕하세요! CGV AI 영화 추천 도우미입니다. 🎬\n\n어떤 영화를 보고 싶으신가요?\n\n예시:\n- 이번 주 액션 영화 뭐 있어?\n- 2명이 볼 수 있는 오늘 저녁 상영 추천해줘\n- 가족이랑 볼 수 있는 영화 추천해줘"}
    ]

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

if prompt := st.chat_input("영화 관련 질문을 입력하세요..."):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    with st.chat_message("assistant"):
        with st.spinner("영화를 찾고 있습니다..."):
            try:
                response = requests.post(
                    f"{BACKEND_URL}/api/chat",
                    json={"message": prompt},
                    timeout=30
                )
                reply = response.json()["reply"] if response.status_code == 200 else "서버 오류가 발생했습니다."
            except requests.exceptions.ConnectionError:
                reply = "백엔드 서버에 연결할 수 없습니다."
            except Exception as e:
                reply = f"오류: {str(e)}"
        st.markdown(reply)
    st.session_state.messages.append({"role": "assistant", "content": reply})

with st.sidebar:
    st.header("💡 사용 팁")
    st.markdown("""
    **이런 질문을 해보세요:**
    - 장르별 (액션, 로맨스, 공포, SF)
    - 관람 인원 (혼자, 커플, 가족)
    - 시간대 (오전, 오후, 저녁)
    - 분위기 (긴장감, 감동, 웃긴)
    """)
    st.divider()
    aws_access_key = os.getenv("AWS_ACCESS_KEY_ID", "")
    if aws_access_key:
        st.success("✅ AWS Bedrock 연동 준비 완료")
    else:
        st.info("ℹ️ Day3에 AWS Bedrock을 연동하세요")
        st.markdown("`.env`에 AWS 인증 정보를 설정해주세요.")
    st.divider()
    if st.button("🗑️ 대화 초기화"):
        st.session_state.messages = [
            {"role": "assistant", "content": "대화가 초기화되었습니다. 새로운 질문을 해주세요! 🎬"}
        ]
        st.rerun()
